import 'package:carport/screens/components/garage/garage_empty_state.dart';
import 'package:carport/screens/components/garage/garage_shell.dart';
import 'package:carport/screens/components/garage/garage_top_bar.dart';
import 'package:flutter/material.dart';

/// Placeholder screen archetype for unimplemented features (Appendix B.3).
class GaragePlaceholderScreen extends StatelessWidget {
  const GaragePlaceholderScreen({
    super.key,
    required this.title,
    required this.icon,
    this.message = 'Coming soon',
  });

  final String title;
  final IconData icon;
  final String message;

  @override
  Widget build(BuildContext context) {
    return GarageShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GarageTopBar(title: title, showBack: false),
          Expanded(
            child: GarageEmptyState(
              icon: icon,
              iconSize: 56,
              message: message,
            ),
          ),
        ],
      ),
    );
  }
}
