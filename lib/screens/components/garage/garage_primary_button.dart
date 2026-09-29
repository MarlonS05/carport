import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';

/// Full-width primary CTA button for form submissions (§5.6).
class GaragePrimaryButton extends StatefulWidget {
  const GaragePrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  State<GaragePrimaryButton> createState() => _GaragePrimaryButtonState();
}

class _GaragePrimaryButtonState extends State<GaragePrimaryButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);
    final enabled = widget.onPressed != null && !widget.isLoading;
    final backgroundColor = _pressed && enabled ? theme.primaryHover : theme.primary;

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
          color: enabled ? backgroundColor : theme.primary.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(GarageRadius.card),
        ),
        alignment: Alignment.center,
        child: widget.isLoading
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: theme.primaryForeground,
                ),
              )
            : Text(
                widget.label,
                style: GarageTextStyles.primaryCta(theme),
              ),
      ),
    );
  }
}
