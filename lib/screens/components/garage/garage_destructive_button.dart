import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';

/// Full-width destructive action button for delete flows.
class GarageDestructiveButton extends StatefulWidget {
  const GarageDestructiveButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  State<GarageDestructiveButton> createState() =>
      _GarageDestructiveButtonState();
}

class _GarageDestructiveButtonState extends State<GarageDestructiveButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);
    final enabled = widget.onPressed != null && !widget.isLoading;
    final borderColor = _pressed && enabled
        ? theme.destructive.withValues(alpha: 0.8)
        : theme.destructive;

    return GestureDetector(
      onTapDown: enabled ? (_) => setState(() => _pressed = true) : null,
      onTapUp: enabled ? (_) => setState(() => _pressed = false) : null,
      onTapCancel: enabled ? () => setState(() => _pressed = false) : null,
      onTap: enabled ? widget.onPressed : null,
      child: AnimatedContainer(
        duration: GarageMotion.standard,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(
            color: enabled
                ? borderColor
                : theme.destructive.withValues(alpha: 0.5),
          ),
          borderRadius: BorderRadius.circular(GarageRadius.card),
        ),
        alignment: Alignment.center,
        child: widget.isLoading
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: theme.destructive,
                ),
              )
            : Text(
                widget.label,
                style: GarageTextStyles.body(
                  theme,
                  color: enabled
                      ? theme.destructive
                      : theme.destructive.withValues(alpha: 0.5),
                ),
              ),
      ),
    );
  }
}
