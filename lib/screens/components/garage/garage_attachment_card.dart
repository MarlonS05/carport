import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

/// Attachment row card for the vehicle attachments list.
class GarageAttachmentCard extends StatelessWidget {
  const GarageAttachmentCard({
    super.key,
    required this.displayName,
    required this.createdLabel,
    required this.onTap,
    required this.onDelete,
  });

  final String displayName;
  final String createdLabel;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(GarageRadius.card),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: theme.card,
            borderRadius: BorderRadius.circular(GarageRadius.card),
            border: Border.all(color: theme.border),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _FileIconBox(displayName: displayName),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        displayName,
                        style: GarageTextStyles.listTitle(theme),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          createdLabel,
                          style: GarageTextStyles.listMeta(theme),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _CardActionButton(
                icon: LucideIcons.trash2,
                semanticsLabel: 'Delete attachment',
                onPressed: onDelete,
                destructive: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FileIconBox extends StatelessWidget {
  const _FileIconBox({required this.displayName});

  final String displayName;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);
    final icon = _iconForFileName(displayName);

    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: theme.foreground.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(GarageRadius.iconBox),
      ),
      alignment: Alignment.center,
      child: Icon(
        icon,
        size: 16,
        color: theme.mutedForeground,
      ),
    );
  }

  IconData _iconForFileName(String name) {
    final lower = name.toLowerCase();
    if (lower.endsWith('.jpg') ||
        lower.endsWith('.jpeg') ||
        lower.endsWith('.png') ||
        lower.endsWith('.gif') ||
        lower.endsWith('.webp')) {
      return LucideIcons.fileImage;
    }
    if (lower.endsWith('.pdf') ||
        lower.endsWith('.txt') ||
        lower.endsWith('.doc') ||
        lower.endsWith('.docx')) {
      return LucideIcons.fileText;
    }
    return LucideIcons.file;
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
