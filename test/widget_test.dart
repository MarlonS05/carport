import 'package:carport/di/di.dart';
import 'package:carport/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'support/db.dart';

/// Full-DI integration smoke test: boots the real dependency graph against an
/// ffi SQLite database and mocked preferences, then pumps the app shell.
void main() {
  setUp(() async {
    initFfiDatabaseFactory();
    SharedPreferences.setMockInitialValues({});
    GoogleFonts.config.allowRuntimeFetching = false;
    await getIt.reset();
    await setupDependencies();
  });

  testWidgets('boots to the garage dashboard', (WidgetTester tester) async {
    await tester.pumpWidget(const CarportApp());
    await tester.pumpAndSettle();

    expect(find.text('Quick Entry'), findsOneWidget);
  });
}
