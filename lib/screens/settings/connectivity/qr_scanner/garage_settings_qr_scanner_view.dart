import 'package:carport/domain/validators/portal_url_validator.dart';
import 'package:carport/platform/garage_qr_scanner_preview.dart';
import 'package:carport/screens/components/garage/garage_error_dialog.dart';
import 'package:carport/screens/components/garage/garage_primary_button.dart';
import 'package:carport/screens/components/garage/garage_section_label.dart';
import 'package:carport/screens/components/garage/garage_settings_status_card.dart';
import 'package:carport/screens/components/garage/garage_shell.dart';
import 'package:carport/screens/components/garage/garage_top_bar.dart';
import 'package:carport/screens/settings/connectivity/qr_scanner/garage_settings_qr_scanner_bloc.dart';
import 'package:carport/screens/settings/connectivity/qr_scanner/garage_settings_qr_scanner_event.dart';
import 'package:carport/screens/settings/connectivity/qr_scanner/garage_settings_qr_scanner_state.dart';
import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_flutter/lucide_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class GarageSettingsQrScannerView extends StatelessWidget {
  const GarageSettingsQrScannerView({super.key});

  static const _urlValidator = PortalUrlValidator();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GarageSettingsQrScannerBloc,
        GarageSettingsQrScannerState>(
      listenWhen: (previous, current) =>
          previous.errorMessage != current.errorMessage,
      listener: (context, state) {
        final message = state.errorMessage;
        if (message != null) {
          showGarageErrorDialog(context, message: message);
        }
      },
      builder: (context, state) {
        final theme = GarageTheme.of(context);
        final scanningEnabled = state.scanPhase == PortalScanPhase.scanning ||
            state.scanPhase == PortalScanPhase.connected;

        return Stack(
          fit: StackFit.expand,
          children: [
            GarageShell(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GarageTopBar(
                    title: 'QR Scanner',
                    onBack: () =>
                        context.read<GarageSettingsQrScannerBloc>().add(
                              const GarageSettingsQrScannerEvent.backTapped(),
                            ),
                  ),
                  Expanded(
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        if (state.scanPhase != PortalScanPhase.cameraDenied)
                          GarageQrScannerPreview(
                            key: ValueKey(
                              state.scanPhase == PortalScanPhase.connected
                                  ? 'connected-${state.portalBaseUrl}'
                                  : 'scanning',
                            ),
                            enabled: scanningEnabled,
                            onDetected: (code) => context
                                .read<GarageSettingsQrScannerBloc>()
                                .add(
                                  GarageSettingsQrScannerEvent.codeDetected(
                                    code,
                                  ),
                                ),
                            onCameraDenied: () => context
                                .read<GarageSettingsQrScannerBloc>()
                                .add(
                                  const GarageSettingsQrScannerEvent
                                      .cameraDenied(),
                                ),
                          )
                        else
                          ColoredBox(color: theme.background),
                        if (scanningEnabled) const _QrViewfinderOverlay(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      GarageSpacing.screenH,
                      GarageSpacing.list,
                      GarageSpacing.screenH,
                      GarageSpacing.screenH,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const GarageSectionLabel(text: 'Portal connection'),
                        GarageSettingsStatusCard(
                          icon: LucideIcons.link,
                          title: 'Carport Monitor',
                          statusLabel: _statusLabel(state),
                          statusColor: _statusColor(theme, state),
                        ),
                        if (state.scanPhase == PortalScanPhase.connected &&
                            !state.isProcessing)
                          Padding(
                            padding: const EdgeInsets.only(
                              top: GarageSpacing.list,
                            ),
                            child: GaragePrimaryButton(
                              label: 'Re-register',
                              onPressed: () => context
                                  .read<GarageSettingsQrScannerBloc>()
                                  .add(
                                    const GarageSettingsQrScannerEvent
                                        .reRegisterTapped(),
                                  ),
                            ),
                          ),
                        if (state.scanPhase == PortalScanPhase.cameraDenied)
                          Padding(
                            padding: const EdgeInsets.only(
                              top: GarageSpacing.list,
                            ),
                            child: GaragePrimaryButton(
                              label: 'Open Settings',
                              onPressed: () => _openAppSettings(),
                            ),
                          ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: GarageSpacing.list),
                          child: Text(
                            _helperText(state),
                            style: GarageTextStyles.body(theme),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (state.scanPhase == PortalScanPhase.syncing)
              const _UploadingOverlay(),
          ],
        );
      },
    );
  }

  static String _statusLabel(GarageSettingsQrScannerState state) {
    return switch (state.scanPhase) {
      PortalScanPhase.scanning => 'Scanning…',
      PortalScanPhase.validating => 'Validating…',
      PortalScanPhase.registering => 'Registering…',
      PortalScanPhase.syncing => 'Uploading…',
      PortalScanPhase.connected =>
        'Connected (${_urlValidator.displayHost(state.portalBaseUrl!)})',
      PortalScanPhase.cameraDenied => 'Camera blocked',
    };
  }

  static Color _statusColor(
    GarageTheme theme,
    GarageSettingsQrScannerState state,
  ) {
    return switch (state.scanPhase) {
      PortalScanPhase.connected => theme.success,
      PortalScanPhase.cameraDenied => theme.destructive,
      PortalScanPhase.scanning ||
      PortalScanPhase.validating ||
      PortalScanPhase.registering ||
      PortalScanPhase.syncing =>
        theme.mutedForeground,
    };
  }

  static String _helperText(GarageSettingsQrScannerState state) {
    return switch (state.scanPhase) {
      PortalScanPhase.connected =>
        'Your portal URL is saved. Scan again to replace it, or re-register if the monitor no longer recognizes this device.',
      PortalScanPhase.cameraDenied =>
        'Camera access is required to scan the portal QR code. Open device settings to allow camera access.',
      _ => 'Scan the QR code displayed on your Carport Monitor.',
    };
  }

  static Future<void> _openAppSettings() async {
    final uri = Uri.parse('app-settings:');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}

class _UploadingOverlay extends StatelessWidget {
  const _UploadingOverlay();

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);

    return Positioned.fill(
      child: AbsorbPointer(
        child: ColoredBox(
          color: theme.background.withValues(alpha: 0.7),
          child: Center(
            child: CircularProgressIndicator(color: theme.primary),
          ),
        ),
      ),
    );
  }
}

class _QrViewfinderOverlay extends StatelessWidget {
  const _QrViewfinderOverlay();

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);

    return IgnorePointer(
      child: CustomPaint(
        painter: _QrViewfinderPainter(
          frameColor: theme.primary,
          overlayColor: theme.background.withValues(alpha: 0.55),
        ),
      ),
    );
  }
}

class _QrViewfinderPainter extends CustomPainter {
  _QrViewfinderPainter({
    required this.frameColor,
    required this.overlayColor,
  });

  final Color frameColor;
  final Color overlayColor;

  @override
  void paint(Canvas canvas, Size size) {
    const frameSize = 220.0;
    final left = (size.width - frameSize) / 2;
    final top = (size.height - frameSize) / 2;
    final rect = Rect.fromLTWH(left, top, frameSize, frameSize);

    final overlayPaint = Paint()..color = overlayColor;
    canvas.drawPath(
      Path.combine(
        PathOperation.difference,
        Path()..addRect(Offset.zero & size),
        Path()..addRRect(
            RRect.fromRectAndRadius(rect, const Radius.circular(12)),
          ),
      ),
      overlayPaint,
    );

    final borderPaint = Paint()
      ..color = frameColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, const Radius.circular(12)),
      borderPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _QrViewfinderPainter oldDelegate) {
    return oldDelegate.frameColor != frameColor ||
        oldDelegate.overlayColor != overlayColor;
  }
}
