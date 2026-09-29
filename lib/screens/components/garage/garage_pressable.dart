import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';

/// Animated surface for list cards, tiles, and similar tappable rows (§8).
class GaragePressable extends StatefulWidget {
  const GaragePressable({
    super.key,
    required this.onTap,
    required this.builder,
    this.duration = GarageMotion.standard,
    this.semanticsLabel,
    this.minHeight = GarageSize.minTap,
  });

  final VoidCallback? onTap;
  final GaragePressableBuilder builder;
  final Duration duration;
  final String? semanticsLabel;
  final double minHeight;

  @override
  State<GaragePressable> createState() => _GaragePressableState();
}

typedef GaragePressableBuilder = Widget Function(
  BuildContext context,
  bool pressed,
);

class _GaragePressableState extends State<GaragePressable> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final child = GestureDetector(
      onTapDown: widget.onTap != null ? (_) => setState(() => _pressed = true) : null,
      onTapUp: widget.onTap != null ? (_) => setState(() => _pressed = false) : null,
      onTapCancel: widget.onTap != null ? () => setState(() => _pressed = false) : null,
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: widget.duration,
        constraints: BoxConstraints(minHeight: widget.minHeight),
        child: widget.builder(context, _pressed),
      ),
    );

    if (widget.semanticsLabel != null) {
      return Semantics(
        button: true,
        label: widget.semanticsLabel,
        child: child,
      );
    }
    return child;
  }
}
