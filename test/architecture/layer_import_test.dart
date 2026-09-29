import 'dart:io';

import 'package:carport_lint_rules/layer_import_rules.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;

void main() {
  test('lib/ import boundaries match docs/architecture.md', () {
    final libDir = Directory(p.join(Directory.current.path, 'lib'));
    expect(libDir.existsSync(), isTrue, reason: 'Run from project root');

    final violations = <String>[];

    for (final file in libDir
        .listSync(recursive: true)
        .whereType<File>()
        .where((f) => f.path.endsWith('.dart'))) {
      final path = file.path;
      final denials = LayerImportRules.denialsForFile(path);
      if (denials.isEmpty) {
        continue;
      }

      final lines = file.readAsLinesSync();
      for (final line in lines) {
        final trimmed = line.trim();
        if (!trimmed.startsWith('import ') && !trimmed.startsWith('export ')) {
          continue;
        }

        final uri = _extractUri(trimmed);
        if (uri == null) {
          continue;
        }

        for (final denial in denials) {
          if (LayerImportRules.importMatchesDenial(uri, denial)) {
            violations.add('$path: $trimmed');
          }
        }
      }
    }

    expect(
      violations,
      isEmpty,
      reason: violations.isEmpty
          ? null
          : 'Layer import violations:\n${violations.join('\n')}',
    );
  });
}

String? _extractUri(String directive) {
  final match = RegExp(r'''^(?:import|export)\s+['"]([^'"]+)['"]''').firstMatch(
    directive,
  );
  return match?.group(1);
}
