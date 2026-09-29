import 'package:any_link_preview/any_link_preview.dart';
import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';
import 'package:lucide_flutter/lucide_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

/// Tappable link preview row for vehicle detail read mode (§5.9).
class GarageLinkRow extends StatelessWidget {
  const GarageLinkRow({super.key, required this.label, required this.url});

  final String label;
  final String url;

  String get _normalizedUrl {
    final trimmed = url.trim();
    if (trimmed.startsWith('http://') || trimmed.startsWith('https://')) {
      return trimmed;
    }
    return 'https://$trimmed';
  }

  Future<void> _openLink() async {
    final uri = Uri.tryParse(_normalizedUrl);
    if (uri == null) return;
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(label, style: GarageTextStyles.fieldLabel(theme)),
        Padding(
          padding: const EdgeInsets.only(top: GarageSpacing.labelGap),
          child: AnyLinkPreview.builder(
            link: _normalizedUrl,
            cache: const Duration(days: 7),
            placeholderWidget: _LinkPreviewPlaceholder(theme: theme),
            errorWidget: _LinkPreviewFallback(
              theme: theme,
              label: label,
              url: url,
              onTap: _openLink,
            ),
            itemBuilder: (context, metadata, imageProvider, _) {
              return _LinkPreviewCard(
                theme: theme,
                label: label,
                url: url,
                metadata: metadata,
                imageProvider: imageProvider,
                onTap: _openLink,
              );
            },
          ),
        ),
      ],
    );
  }
}

class _LinkPreviewCard extends StatelessWidget {
  const _LinkPreviewCard({
    required this.theme,
    required this.label,
    required this.url,
    required this.metadata,
    required this.onTap,
    this.imageProvider,
  });

  final GarageTheme theme;
  final String label;
  final String url;
  final Metadata metadata;
  final ImageProvider? imageProvider;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final title = metadata.title?.trim();
    final description = metadata.desc?.trim();
    final displayTitle = (title != null && title.isNotEmpty) ? title : label;
    final displayBody = (description != null && description.isNotEmpty)
        ? description
        : url;

    return Semantics(
      button: true,
      label: '$label, opens in browser',
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(GarageRadius.card),
          child: Ink(
            decoration: BoxDecoration(
              color: theme.card,
              borderRadius: BorderRadius.circular(GarageRadius.card),
              border: Border.all(color: theme.border),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (imageProvider != null)
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(GarageRadius.card),
                      bottomLeft: Radius.circular(GarageRadius.card),
                    ),
                    child: Image(
                      image: imageProvider!,
                      width: 88,
                      height: 88,
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) => _LinkIconBox(theme: theme),
                    ),
                  )
                else
                  _LinkIconBox(theme: theme),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          displayTitle,
                          style: GarageTextStyles.listTitle(theme, size: 14),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            displayBody,
                            style: GarageTextStyles.listMeta(theme),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LinkIconBox extends StatelessWidget {
  const _LinkIconBox({required this.theme});

  final GarageTheme theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 88,
      height: 88,
      color: theme.muted,
      alignment: Alignment.center,
      child: Icon(LucideIcons.link2, size: 20, color: theme.mutedForeground),
    );
  }
}

class _LinkPreviewPlaceholder extends StatelessWidget {
  const _LinkPreviewPlaceholder({required this.theme});

  final GarageTheme theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      decoration: BoxDecoration(
        color: theme.card,
        borderRadius: BorderRadius.circular(GarageRadius.card),
        border: Border.all(color: theme.border),
      ),
      alignment: Alignment.center,
      child: SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(strokeWidth: 2, color: theme.primary),
      ),
    );
  }
}

class _LinkPreviewFallback extends StatelessWidget {
  const _LinkPreviewFallback({
    required this.theme,
    required this.label,
    required this.url,
    required this.onTap,
  });

  final GarageTheme theme;
  final String label;
  final String url;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: '$label, opens in browser',
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(GarageRadius.card),
          child: Ink(
            decoration: BoxDecoration(
              color: theme.card,
              borderRadius: BorderRadius.circular(GarageRadius.card),
              border: Border.all(color: theme.border),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: theme.muted,
                      borderRadius: BorderRadius.circular(GarageRadius.iconBox),
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      LucideIcons.link2,
                      size: 14,
                      color: theme.mutedForeground,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            label,
                            style: GarageTextStyles.fieldLabel(theme),
                          ),
                          Text(
                            url,
                            style: GarageTextStyles.listMeta(theme),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
