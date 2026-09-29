import 'package:carport/screens/components/garage/garage_pressable.dart';
import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

/// Tappable list row for vehicles and similar items (§5.7).
class GarageListCard extends StatefulWidget {
  const GarageListCard({
    super.key,
    required this.title,
    required this.onTap,
    this.subtitle,
    this.icon = LucideIcons.car,
    this.titleSize = 16,
  });

  final String title;
  final String? subtitle;
  final VoidCallback onTap;
  final IconData icon;
  final double titleSize;

  @override
  State<GarageListCard> createState() => _GarageListCardState();
}

class _GarageListCardState extends State<GarageListCard> {
  bool _chevronPressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);

    return GaragePressable(
      onTap: widget.onTap,
      semanticsLabel: widget.title,
      builder: (context, pressed) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: pressed ? theme.secondary : theme.card,
            borderRadius: BorderRadius.circular(GarageRadius.card),
            border: Border.all(
              color: pressed
                  ? theme.primary.withValues(alpha: 0.4)
                  : theme.border,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: theme.secondary,
                  borderRadius: BorderRadius.circular(GarageRadius.iconBox),
                ),
                alignment: Alignment.center,
                child: Icon(
                  widget.icon,
                  size: 20,
                  color: theme.primary,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.title,
                        style: GarageTextStyles.listTitle(
                          theme,
                          size: widget.titleSize,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (widget.subtitle != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            widget.subtitle!,
                            style: GarageTextStyles.listMeta(theme),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTapDown: (_) => setState(() => _chevronPressed = true),
                onTapUp: (_) => setState(() => _chevronPressed = false),
                onTapCancel: () => setState(() => _chevronPressed = false),
                child: AnimatedContainer(
                  duration: GarageMotion.standard,
                  child: Icon(
                    LucideIcons.chevronRight,
                    size: 16,
                    color: _chevronPressed ? theme.primary : theme.mutedForeground,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
