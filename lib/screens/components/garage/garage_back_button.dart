import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

/// Circular back control used in [GarageTopBar] (§5.3).
class GarageBackButton extends StatefulWidget {
  const GarageBackButton({
    super.key,
    this.onBack,
    this.enabled = true,
  });

  final VoidCallback? onBack;
  final bool enabled;

  @override
  State<GarageBackButton> createState() => _GarageBackButtonState();
}

class _GarageBackButtonState extends State<GarageBackButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);
    final iconColor = _pressed ? theme.foreground : theme.mutedForeground;

    return Semantics(
      button: widget.enabled,
      enabled: widget.enabled,
      label: 'Back',
      child: Opacity(
        opacity: widget.enabled ? 1 : 0.35,
        child: GestureDetector(
          onTapDown: widget.enabled ? (_) => setState(() => _pressed = true) : null,
          onTapUp: widget.enabled ? (_) => setState(() => _pressed = false) : null,
          onTapCancel: widget.enabled ? () => setState(() => _pressed = false) : null,
          onTap: widget.enabled ? widget.onBack : null,
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
              LucideIcons.chevronLeft,
              size: 18,
              color: iconColor,
            ),
          ),
        ),
      ),
    );
  }
}
