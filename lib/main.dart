import 'package:carport/di/di.dart';
import 'package:carport/domain/entities/color_theme_preset.dart';
import 'package:carport/router/app_router.dart';
import 'package:carport/theme/app_themes/app_theme_cubit.dart';
import 'package:carport/theme/app_themes/app_themes.dart';
import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  await getIt<AppThemeCubit>().load();
  runApp(const CarportApp());
}

class CarportApp extends StatelessWidget {
  const CarportApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<AppThemeCubit>(),
      child: BlocBuilder<AppThemeCubit, ColorThemePreset>(
        builder: (context, preset) {
          final garage = AppThemes.themeFor(preset);
          return MaterialApp.router(
            title: 'Carport',
            theme: buildCarportTheme(garage),
            routerConfig: getIt.get<AppRouter>().instance,
          );
        },
      ),
    );
  }
}
