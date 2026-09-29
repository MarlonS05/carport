import 'dart:io';

import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

/// Service log entry card with title, date, description, mileage, and optional image (§6.7).
class GarageEntryCard extends StatelessWidget {
  const GarageEntryCard({
    super.key,
    required this.title,
    required this.date,
    this.description,
    this.mileage,
    this.imagePath,
    this.onEdit,
  });

  final String title;
  final String date;
  final String? description;
  final String? mileage;
  final String? imagePath;
  final VoidCallback? onEdit;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);
    final hasDescription = description != null && description!.isNotEmpty;
    final hasMileage = mileage != null && mileage!.isNotEmpty;
    final hasImage = imagePath != null && imagePath!.isNotEmpty;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.card,
        borderRadius: BorderRadius.circular(GarageRadius.card),
        border: Border.all(color: theme.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: GarageTextStyles.listTitle(theme, size: 18),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              Text(date, style: GarageTextStyles.listMeta(theme)),
            ],
          ),
          if (hasDescription) ...[
            const SizedBox(height: 8),
            Text(description!, style: GarageTextStyles.body(theme)),
          ],
          if (hasMileage || onEdit != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (hasMileage)
                    Row(
                      children: [
                        Icon(
                          LucideIcons.gauge,
                          size: 11,
                          color: theme.mutedForeground,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Text(
                            mileage!,
                            style: GarageTextStyles.listMeta(theme),
                          ),
                        ),
                      ],
                    ),
                  if (onEdit != null) ...[
                    const Spacer(),
                    _EntryEditButton(onEdit: onEdit!, title: title),
                  ],
                ],
              ),
            ),
          if (hasImage) ...[
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(GarageRadius.input),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: _EntryImage(path: imagePath!),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _EntryEditButton extends StatelessWidget {
  const _EntryEditButton({required this.onEdit, required this.title});

  final VoidCallback onEdit;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);

    return Semantics(
      button: true,
      label: 'Edit $title',
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onEdit,
          borderRadius: BorderRadius.circular(GarageRadius.input),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(GarageRadius.input),
              border: Border.all(color: theme.border),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(LucideIcons.pencil, size: 14, color: theme.foreground),
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Text('EDIT', style: GarageTextStyles.editPill(theme)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EntryImage extends StatelessWidget {
  const _EntryImage({required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    if (path.startsWith('http')) {
      return Image.network(
        path,
        fit: BoxFit.cover,
        semanticLabel: 'Entry photo',
        errorBuilder: (_, __, ___) => const _ImagePlaceholder(),
      );
    }

    if (!kIsWeb && path.startsWith('/')) {
      return Image.file(
        File(path),
        fit: BoxFit.cover,
        semanticLabel: 'Entry photo',
        errorBuilder: (_, __, ___) => const _ImagePlaceholder(),
      );
    }

    return const _ImagePlaceholder();
  }
}

class _ImagePlaceholder extends StatelessWidget {
  const _ImagePlaceholder();

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);
    return ColoredBox(
      color: theme.secondary,
      child: Center(
        child: Icon(LucideIcons.image, color: theme.mutedForeground),
      ),
    );
  }
}
