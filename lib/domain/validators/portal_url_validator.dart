/// Validates and normalizes a scanned portal base URL.
class PortalUrlValidator {
  const PortalUrlValidator();

  /// Returns normalized base URL (no trailing slash, no `/api` suffix) or null.
  String? normalize(String raw) {
    final trimmed = raw.trim();
    if (trimmed.isEmpty) {
      return null;
    }

    Uri? uri;
    try {
      uri = Uri.parse(trimmed);
    } on FormatException {
      return null;
    }

    if (uri.scheme != 'http' && uri.scheme != 'https') {
      return null;
    }
    if (uri.host.isEmpty) {
      return null;
    }

    var path = uri.path;
    while (path.endsWith('/')) {
      path = path.substring(0, path.length - 1);
    }
    if (path.toLowerCase().endsWith('/api')) {
      path = path.substring(0, path.length - 4);
      while (path.endsWith('/')) {
        path = path.substring(0, path.length - 1);
      }
    }

    final buffer = StringBuffer('${uri.scheme}://${uri.host}');
    if (uri.hasPort) {
      buffer.write(':${uri.port}');
    }
    if (path.isNotEmpty) {
      buffer.write(path);
    }
    return buffer.toString();
  }

  /// API base URL for monitor HTTP calls (`{portalBaseUrl}/api`).
  String apiBaseUrl(String portalBaseUrl) => '$portalBaseUrl/api';

  /// Hostname for display subtitles.
  String displayHost(String baseUrl) {
    final uri = Uri.parse(baseUrl);
    return uri.host;
  }
}
