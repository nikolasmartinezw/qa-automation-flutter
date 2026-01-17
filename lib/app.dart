import 'package:flutter/material.dart';
import 'core/theme/symmetry_theme.dart';
import 'features/tasks/views/home_page.dart';

import 'core/theme/theme_controller.dart';

/// Symmetry Club App
///
/// QA Automation Showcase Application
/// Built with Clean Architecture + MVC Pattern
class SymmetryApp extends StatelessWidget {
  final ThemeController themeController;

  const SymmetryApp({Key? key, required this.themeController})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: themeController,
      builder: (context, _) {
        return MaterialApp(
          title: 'Patrol QA App',
          debugShowCheckedModeBanner: false,
          themeMode: themeController.themeMode,
          theme: SymmetryTheme.lightTheme,
          darkTheme: SymmetryTheme.darkTheme,
          home: HomePage(themeController: themeController),
        );
      },
    );
  }
}
