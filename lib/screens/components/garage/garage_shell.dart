import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';

/// App shell: dark scaffold, centered content capped at 384 logical px (§5.1).
class GarageShell extends StatelessWidget {
  const GarageShell({
    super.key,
    required this.child,
    this.floatingActionButton,
  });

  final Widget child;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);

    return Scaffold(
      backgroundColor: theme.background,
      floatingActionButton: floatingActionButton,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: GarageSize.maxWidth),
            child: child,
          ),
        ),
      ),
    );
  }
}
