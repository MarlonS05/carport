import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

/// Camera QR preview for portal URL scanning.
class GarageQrScannerPreview extends StatefulWidget {
  const GarageQrScannerPreview({
    super.key,
    required this.onDetected,
    this.onCameraDenied,
    this.enabled = true,
  });

  final void Function(String code) onDetected;
  final VoidCallback? onCameraDenied;
  final bool enabled;

  @override
  State<GarageQrScannerPreview> createState() => _GarageQrScannerPreviewState();
}

class _GarageQrScannerPreviewState extends State<GarageQrScannerPreview> {
  final MobileScannerController _controller = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
    facing: CameraFacing.back,
    formats: const [BarcodeFormat.qrCode],
  );

  bool _cameraDeniedReported = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant GarageQrScannerPreview oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!widget.enabled && oldWidget.enabled) {
      _controller.pause();
    }
    if (widget.enabled && !oldWidget.enabled) {
      _controller.start();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MobileScanner(
      controller: _controller,
      onDetect: _handleDetect,
      errorBuilder: (context, error) {
        if (!_cameraDeniedReported) {
          _cameraDeniedReported = true;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            widget.onCameraDenied?.call();
          });
        }
        return const SizedBox.expand();
      },
    );
  }

  void _handleDetect(BarcodeCapture capture) {
    if (!widget.enabled) {
      return;
    }

    for (final barcode in capture.barcodes) {
      final value = barcode.rawValue;
      if (value != null && value.isNotEmpty) {
        widget.onDetected(value);
        return;
      }
    }
  }
}
