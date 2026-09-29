import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';

/// Edit/Save pill toggle for vehicle detail top bar (§5.12).
class GarageEditToggle extends StatelessWidget {
  const GarageEditToggle({
    super.key,
    required this.isEditing,
    required this.onEdit,
    required this.onSave,
  });

  final bool isEditing;
  final VoidCallback onEdit;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);

    return Semantics(
      button: true,
      label: isEditing ? 'Save' : 'Edit',
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isEditing ? onSave : onEdit,
          borderRadius: BorderRadius.circular(999),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: theme.secondary,
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: theme.border),
            ),
            child: Text(
              isEditing ? 'SAVE' : 'EDIT',
              style: GarageTextStyles.editPill(theme),
            ),
          ),
        ),
      ),
    );
  }
}
