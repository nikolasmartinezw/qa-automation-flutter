import 'package:flutter/material.dart';
import 'core/theme/symmetry_theme.dart';
import 'app.dart';

/// Main Entry Point
///
/// Symmetry Club - QA Automation Showcase
///
/// Architecture: Clean Architecture + MVC
///
/// Structure:
/// ├── lib/
/// │   ├── main.dart                          # Entry point
/// │   ├── app.dart                           # App widget
/// │   ├── core/
/// │   │   └── theme/
/// │   │       ├── symmetry_colors.dart       # Color palette
/// │   │       └── symmetry_theme.dart        # Theme configuration
/// │   ├── features/
/// │   │   └── tasks/
/// │   │       ├── models/
/// │   │       │   └── task.dart              # Task model
/// │   │       ├── controllers/
/// │   │       │   └── task_controller.dart   # Business logic
/// │   │       └── views/
/// │   │           ├── home_page.dart         # Main page
/// │   │           └── widgets/
/// │   │               ├── header_widget.dart
/// │   │               ├── stats_section.dart
/// │   │               ├── task_input.dart
/// │   │               ├── task_list.dart
/// │   │               ├── task_item.dart
/// │   │               ├── empty_state.dart
/// │   │               └── clear_button.dart
/// │   └── shared/
/// │       └── widgets/
/// │           ├── animated_background.dart
/// │           └── grid_pattern_painter.dart
import 'core/theme/theme_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SymmetryTheme.configureSystemUI();

  final themeController = ThemeController();

  runApp(SymmetryApp(themeController: themeController));
}
