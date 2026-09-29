import 'package:carport/screens/components/garage/garage_mileage_read_row.dart';
import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

/// Maintenance schedule image section for vehicle detail (§5).
class GarageMaintenanceScheduleSection extends StatelessWidget {
  const GarageMaintenanceScheduleSection({
    super.key,
    required this.imageBase64,
    required this.isEditing,
    required this.onPickImage,
    required this.onRemoveImage,
    this.emptyLabel = 'No schedule uploaded',
    this.uploadLabel = 'Tap to upload schedule',
  });

  final String? imageBase64;
  final bool isEditing;
  final VoidCallback onPickImage;
  final VoidCallback onRemoveImage;
  final String emptyLabel;
  final String uploadLabel;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);

    if (imageBase64 != null && imageBase64!.isNotEmpty) {
      return _MaintenanceImage(
        base64Image: imageBase64!,
        isEditing: isEditing,
        onReplace: onPickImage,
        onRemove: onRemoveImage,
      );
    }

    if (isEditing) {
      return _UploadZone(
        onTap: onPickImage,
        label: uploadLabel,
      );
    }

    return Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(GarageRadius.input),
        border: Border.all(color: theme.border),
      ),
      alignment: Alignment.center,
      child: Text(
        emptyLabel,
        style: GarageTextStyles.body(theme),
      ),
    );
  }
}

class _MaintenanceImage extends StatelessWidget {
  const _MaintenanceImage({
    required this.base64Image,
    required this.isEditing,
    required this.onReplace,
    required this.onRemove,
  });

  final String base64Image;
  final bool isEditing;
  final VoidCallback onReplace;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);
    final imageBytes = decodeGarageBase64Image(base64Image);

    return ClipRRect(
      borderRadius: BorderRadius.circular(GarageRadius.input),
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: ColoredBox(
              color: theme.secondary,
              child: imageBytes == null
                  ? _ImageErrorPlaceholder(theme: theme)
                  : Image.memory(
                      imageBytes,
                      fit: BoxFit.contain,
                      errorBuilder: (_, _, _) =>
                          _ImageErrorPlaceholder(theme: theme),
                    ),
            ),
          ),
          if (isEditing)
            Positioned(
              top: 8,
              right: 8,
              child: Row(
                children: [
                  _ImageOverlayButton(
                    icon: LucideIcons.refreshCw,
                    label: 'Replace',
                    onTap: onReplace,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: _ImageOverlayButton(
                      icon: LucideIcons.trash2,
                      label: 'Remove',
                      onTap: onRemove,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _ImageErrorPlaceholder extends StatelessWidget {
  const _ImageErrorPlaceholder({required this.theme});

  final GarageTheme theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: theme.secondary,
      alignment: Alignment.center,
      child: Text(
        'Could not load image',
        style: GarageTextStyles.body(theme),
      ),
    );
  }
}

class _ImageOverlayButton extends StatelessWidget {
  const _ImageOverlayButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);

    return Semantics(
      button: true,
      label: label,
      child: Material(
        color: theme.card.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(GarageRadius.iconBox),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(GarageRadius.iconBox),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Icon(icon, size: 16, color: theme.foreground),
          ),
        ),
      ),
    );
  }
}

class _UploadZone extends StatelessWidget {
  const _UploadZone({required this.onTap, required this.label});

  final VoidCallback onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);

    return Semantics(
      button: true,
      label: label,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(GarageRadius.input),
          child: Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(GarageRadius.input),
              border: Border.all(color: theme.border),
            ),
            child: CustomPaint(
              painter: _DashedBorderPainter(color: theme.mutedForeground),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      LucideIcons.imagePlus,
                      size: 24,
                      color: theme.mutedForeground,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        label,
                        style: GarageTextStyles.body(theme),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  _DashedBorderPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withValues(alpha: 0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    const dashWidth = 6.0;
    const dashSpace = 4.0;
    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(1, 1, size.width - 2, size.height - 2),
          const Radius.circular(GarageRadius.input),
        ),
      );

    for (final metric in path.computeMetrics()) {
      var distance = 0.0;
      while (distance < metric.length) {
        final end = distance + dashWidth;
        canvas.drawPath(
          metric.extractPath(distance, end.clamp(0, metric.length)),
          paint,
        );
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
