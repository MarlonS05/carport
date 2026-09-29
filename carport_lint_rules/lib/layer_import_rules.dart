/// Import deny patterns keyed by file-path predicate name.
///
/// Keep in sync with [docs/architecture.md](../../docs/architecture.md) § Strict import table.
class LayerImportRules {
  const LayerImportRules._();

  static const List<String> domainDeny = [
    'package:flutter/',
    'package:carport/screens/',
    'package:carport/repo/',
    'package:carport/db/',
    'package:carport/router/',
    'package:carport/di/',
    'package:carport/theme/',
    'package:carport/platform/',
    'package:flutter_bloc/',
    'package:go_router/',
  ];

  static const List<String> repoDeny = [
    'package:flutter/',
    'package:carport/screens/',
    'package:carport/router/',
    'package:carport/di/',
    'package:flutter_bloc/',
    'package:go_router/',
  ];

  static const List<String> dbDeny = [
    'package:flutter/',
    'package:carport/screens/',
    'package:carport/repo/',
    'package:carport/router/',
    'package:carport/di/',
    'package:flutter_bloc/',
    'package:go_router/',
  ];

  static const List<String> viewDeny = [
    'package:carport/repo/',
    'package:carport/db/',
    'package:carport/router/',
    'package:carport/di/',
    'package:go_router/',
  ];

  static const List<String> blocDeny = [
    'package:carport/repo/',
    'package:carport/db/',
    'package:go_router/',
    'package:sqflite/',
    'package:image_picker/',
    'package:file_picker/',
    'package:open_filex/',
    'package:mobile_scanner/',
    'package:url_launcher/',
    'package:http/',
    'package:local_auth/',
  ];

  static const List<String> componentDeny = [
    'package:carport/repo/',
    'package:carport/db/',
    'package:carport/router/',
    'package:carport/di/',
    'package:flutter_bloc/',
    'package:go_router/',
  ];

  static const List<String> platformDeny = [
    'package:carport/screens/',
    'package:carport/router/',
    'package:carport/di/',
    'package:carport/repo/',
    'package:carport/db/',
    'package:flutter_bloc/',
    'package:go_router/',
  ];

  static List<String> denialsForFile(String path) {
    final normalized = path.replaceAll(r'\', '/');

    if (normalized.contains('/lib/domain/')) {
      return domainDeny;
    }
    if (normalized.contains('/lib/repo/')) {
      return repoDeny;
    }
    if (normalized.contains('/lib/db/')) {
      return dbDeny;
    }
    if (normalized.contains('/lib/platform/')) {
      return platformDeny;
    }
    if (normalized.contains('/lib/screens/components/garage/')) {
      return componentDeny;
    }
    if (_isScreenPresentationFile(normalized)) {
      if (normalized.endsWith('_view.dart')) {
        return viewDeny;
      }
      if (normalized.endsWith('_bloc.dart') ||
          normalized.endsWith('_event.dart') ||
          normalized.endsWith('_state.dart')) {
        return blocDeny;
      }
    }

    return const [];
  }

  static bool _isScreenPresentationFile(String path) {
    return path.contains('/lib/screens/') &&
        !path.contains('/lib/screens/components/');
  }

  static bool importMatchesDenial(String importUri, String denialPrefix) {
    if (importUri.startsWith(denialPrefix)) {
      return true;
    }

    if (denialPrefix.startsWith('package:carport/')) {
      final suffix = denialPrefix.substring('package:carport/'.length);
      return importUri.contains('/$suffix') || importUri.startsWith(suffix);
    }

    return false;
  }
}
