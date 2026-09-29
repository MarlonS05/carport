import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

/// Reminder row card for the reminders list.
class GarageReminderCard extends StatelessWidget {
  const GarageReminderCard({
    super.key,
    required this.name,
    this.body,
    required this.dueLabel,
    required this.repeating,
    this.recurrenceLabel,
    required this.onEdit,
    required this.onDelete,
  });

  final String name;
  final String? body;
  final String dueLabel;
  final bool repeating;
  final String? recurrenceLabel;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);
    final hasBody = body != null && body!.trim().isNotEmpty;
    final hasRecurrence = repeating &&
        recurrenceLabel != null &&
        recurrenceLabel!.trim().isNotEmpty;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.card,
        borderRadius: BorderRadius.circular(GarageRadius.card),
        border: Border.all(color: theme.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _TypeIconBox(repeating: repeating),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GarageTextStyles.listTitle(theme),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (hasBody)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        body!,
                        style: GarageTextStyles.body(theme),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: hasRecurrence
                        ? Text(
                            recurrenceLabel!,
                            style: GarageTextStyles.listMeta(theme).copyWith(
                              color: theme.primary,
                            ),
                          )
                        : Text(
                            dueLabel,
                            style: GarageTextStyles.listMeta(theme),
                          ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              _CardActionButton(
                icon: LucideIcons.pencil,
                semanticsLabel: 'Edit reminder',
                onPressed: onEdit,
              ),
              _CardActionButton(
                icon: LucideIcons.trash2,
                semanticsLabel: 'Delete reminder',
                onPressed: onDelete,
                destructive: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TypeIconBox extends StatelessWidget {
  const _TypeIconBox({required this.repeating});

  final bool repeating;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);

    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: repeating
            ? theme.primary.withValues(alpha: 0.12)
            : theme.foreground.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(GarageRadius.iconBox),
      ),
      alignment: Alignment.center,
      child: Icon(
        repeating ? LucideIcons.repeat2 : LucideIcons.clock,
        size: 16,
        color: repeating ? theme.primary : theme.mutedForeground,
      ),
    );
  }
}

class _CardActionButton extends StatefulWidget {
  const _CardActionButton({
    required this.icon,
    required this.semanticsLabel,
    required this.onPressed,
    this.destructive = false,
  });

  final IconData icon;
  final String semanticsLabel;
  final VoidCallback onPressed;
  final bool destructive;

  @override
  State<_CardActionButton> createState() => _CardActionButtonState();
}

class _CardActionButtonState extends State<_CardActionButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);
    final color = widget.destructive && _pressed
        ? theme.destructive
        : theme.mutedForeground;

    return Semantics(
      button: true,
      label: widget.semanticsLabel,
      child: GestureDetector(
        onTapDown: (_) => setState(() => _pressed = true),
        onTapUp: (_) => setState(() => _pressed = false),
        onTapCancel: () => setState(() => _pressed = false),
        onTap: widget.onPressed,
        child: SizedBox(
          width: 32,
          height: 32,
          child: Icon(widget.icon, size: 16, color: color),
        ),
      ),
    );
  }
}
