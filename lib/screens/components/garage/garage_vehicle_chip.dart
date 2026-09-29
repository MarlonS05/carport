import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

/// Compact vehicle name chip for forms and service log headers (§5.8).
class GarageVehicleChip extends StatelessWidget {
  const GarageVehicleChip({
    super.key,
    required this.vehicleName,
  });

  final String vehicleName;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: theme.secondary,
        borderRadius: BorderRadius.circular(GarageRadius.input),
        border: Border.all(color: theme.border),
      ),
      child: Row(
        children: [
          Icon(
            LucideIcons.car,
            size: 14,
            color: theme.primary,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    theme.foreground,
                    theme.foreground.withValues(alpha: 0),
                  ],
                  stops: const [0.72, 1],
                ).createShader(bounds),
                blendMode: BlendMode.dstIn,
                child: Text(
                  vehicleName,
                  style: GarageTextStyles.body(
                    theme,
                    color: theme.foreground,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
