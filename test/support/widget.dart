import 'package:carport/domain/entities/color_theme_preset.dart';
import 'package:carport/theme/app_themes/app_themes.dart';
import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

/// Pumps a view under a [MaterialApp] with the app theme and a provided BLoC.
///
/// Pass the BLoC's declared type as [B] (e.g. `pumpView<GarageHomeBloc>`) so the
/// provider is registered under the type the view looks up via `context.read`.
Future<void> pumpView<B extends StateStreamableSource<Object?>>(
  WidgetTester tester, {
  required B bloc,
  required Widget view,
  ColorThemePreset colorThemePreset = AppThemes.defaultPreset,
}) async {
  GoogleFonts.config.allowRuntimeFetching = false;
  final garage = AppThemes.themeFor(colorThemePreset);
  await tester.pumpWidget(
    MaterialApp(
      theme: buildCarportTheme(garage),
      home: BlocProvider<B>.value(value: bloc, child: view),
    ),
  );
}
