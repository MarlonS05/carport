import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';

/// Circular secondary TopBar action (back-button style, configurable icon).
class GarageSecondaryIconButton extends StatefulWidget {
  const GarageSecondaryIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.semanticsLabel,
    this.enabled = true,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final String semanticsLabel;
  final bool enabled;

  @override
  State<GarageSecondaryIconButton> createState() =>
      _GarageSecondaryIconButtonState();
}

class _GarageSecondaryIconButtonState extends State<GarageSecondaryIconButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);
    final iconColor = _pressed ? theme.foreground : theme.mutedForeground;

    return Semantics(
      button: widget.enabled,
      enabled: widget.enabled,
      label: widget.semanticsLabel,
      child: Opacity(
        opacity: widget.enabled ? 1 : 0.35,
        child: GestureDetector(
          onTapDown:
              widget.enabled ? (_) => setState(() => _pressed = true) : null,
          onTapUp:
              widget.enabled ? (_) => setState(() => _pressed = false) : null,
          onTapCancel:
              widget.enabled ? () => setState(() => _pressed = false) : null,
          onTap: widget.enabled ? widget.onPressed : null,
          child: AnimatedContainer(
            duration: GarageMotion.standard,
            width: GarageSize.backButton,
            height: GarageSize.backButton,
            decoration: BoxDecoration(
              color: theme.secondary,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Icon(
              widget.icon,
              size: 18,
              color: iconColor,
            ),
          ),
        ),
      ),
    );
  }
}
