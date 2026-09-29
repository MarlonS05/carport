import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

/// Primary FAB for the garage vehicle list (§5.10).
class GarageFab extends StatefulWidget {
  const GarageFab({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  State<GarageFab> createState() => _GarageFabState();
}

class _GarageFabState extends State<GarageFab> {
  bool _pressed = false;
  bool _highlighted = false;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);
    final scale = _pressed ? 0.95 : (_highlighted ? 1.05 : 1.0);

    return Semantics(
      button: true,
      label: 'Add vehicle',
      child: Padding(
        padding: const EdgeInsets.only(right: 20, bottom: 24),
        child: MouseRegion(
          onEnter: (_) => setState(() => _highlighted = true),
          onExit: (_) => setState(() => _highlighted = false),
          child: GestureDetector(
            onTapDown: (_) => setState(() => _pressed = true),
            onTapUp: (_) => setState(() => _pressed = false),
            onTapCancel: () => setState(() => _pressed = false),
            onTap: widget.onPressed,
            child: AnimatedScale(
              scale: scale,
              duration: GarageMotion.fab,
              child: Material(
                elevation: 6,
                color: theme.primary,
                shape: const CircleBorder(),
                child: SizedBox(
                  width: GarageSize.fab,
                  height: GarageSize.fab,
                  child: Icon(
                    LucideIcons.plus,
                    size: 24,
                    color: theme.primaryForeground,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
