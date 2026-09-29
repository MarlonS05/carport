import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

/// One-time / Repeating segmented control for reminder forms.
class GarageReminderTypeToggle extends StatelessWidget {
  const GarageReminderTypeToggle({
    super.key,
    required this.repeating,
    required this.onChanged,
  });

  final bool repeating;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: theme.secondary,
        borderRadius: BorderRadius.circular(GarageRadius.card),
        border: Border.all(color: theme.border),
      ),
      child: Row(
        children: [
          Expanded(
            child: _Segment(
              label: 'One-time',
              icon: LucideIcons.clock,
              selected: !repeating,
              onTap: () => onChanged(false),
            ),
          ),
          Expanded(
            child: _Segment(
              label: 'Repeating',
              icon: LucideIcons.repeat2,
              selected: repeating,
              onTap: () => onChanged(true),
            ),
          ),
        ],
      ),
    );
  }
}

class _Segment extends StatefulWidget {
  const _Segment({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  State<_Segment> createState() => _SegmentState();
}

class _SegmentState extends State<_Segment> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);
    final isRepeatingSegment = widget.label == 'Repeating';

    Color backgroundColor;
    Color textColor;
    if (widget.selected) {
      backgroundColor = isRepeatingSegment ? theme.primary : theme.card;
      textColor =
          isRepeatingSegment ? theme.primaryForeground : theme.foreground;
    } else {
      backgroundColor = Colors.transparent;
      textColor = theme.mutedForeground;
    }

    if (_pressed && widget.selected) {
      backgroundColor = isRepeatingSegment
          ? theme.primaryHover
          : theme.card.withValues(alpha: 0.85);
    }

    return Semantics(
      button: true,
      selected: widget.selected,
      label: widget.label,
      child: GestureDetector(
        onTapDown: (_) => setState(() => _pressed = true),
        onTapUp: (_) => setState(() => _pressed = false),
        onTapCancel: () => setState(() => _pressed = false),
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: GarageMotion.standard,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(GarageRadius.input),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icon, size: 13, color: textColor),
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Text(
                  widget.label.toUpperCase(),
                  style: GarageTextStyles.editPill(theme).copyWith(
                    color: textColor,
                    fontSize: 12,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
