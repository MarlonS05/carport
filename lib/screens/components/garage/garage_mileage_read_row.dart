import 'dart:convert';
import 'dart:typed_data';

import 'package:carport/domain/entities/distance_unit.dart';
import 'package:carport/domain/formatters/garage_mileage_formatter.dart';
import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

Uint8List? decodeGarageBase64Image(String base64Image) {
  try {
    return base64Decode(base64Image);
  } on FormatException {
    return null;
  }
}

/// Read-only mileage display row for vehicle detail.
class GarageMileageReadRow extends StatelessWidget {
  const GarageMileageReadRow({
    super.key,
    required this.mileage,
    this.unit = DistanceUnit.miles,
  });

  final double mileage;
  final DistanceUnit unit;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);
    final formatted = mileage > 0
        ? GarageMileageFormatter.formatDisplay(mileage, unit: unit)
        : '—';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: theme.secondary,
        borderRadius: BorderRadius.circular(GarageRadius.input),
        border: Border.all(color: theme.border),
      ),
      child: Row(
        children: [
          Icon(LucideIcons.gauge, size: 14, color: theme.mutedForeground),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              formatted,
              style: GarageTextStyles.body(
                theme,
                color: theme.foreground,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
