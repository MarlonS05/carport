import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

/// Circular trailing TopBar action (reminders add button).
class GarageIconActionButton extends StatefulWidget {
  const GarageIconActionButton({
    super.key,
    this.icon = LucideIcons.plus,
    required this.onPressed,
    required this.semanticsLabel,
    this.enabled = true,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final String semanticsLabel;
  final bool enabled;

  @override
  State<GarageIconActionButton> createState() => _GarageIconActionButtonState();
}

class _GarageIconActionButtonState extends State<GarageIconActionButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);
    final backgroundColor = _pressed ? theme.primaryHover : theme.primary;

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
              color: backgroundColor,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Icon(
              widget.icon,
              size: 18,
              color: theme.primaryForeground,
            ),
          ),
        ),
      ),
    );
  }
}
