// Widget test for Symmetry Club QA Automation Showcase
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_automation_app/app.dart';
import 'package:flutter_automation_app/core/theme/theme_controller.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('App renders correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(SymmetryApp(themeController: ThemeController()));

    // Verify that the app title is displayed
    expect(find.text('SYMMETRY CLUB'), findsOneWidget);

    // Verify that the subtitle is displayed
    expect(find.text('QA Automation Showcase'), findsOneWidget);

    // Verify the empty state message is displayed
    expect(find.text('NO TASKS YET'), findsOneWidget);
  });

  testWidgets('Can add a task', (WidgetTester tester) async {
    await tester.pumpWidget(SymmetryApp(themeController: ThemeController()));

    // Find the text input and add button
    final textInput = find.byKey(const Key('textInput'));
    final addButton = find.byKey(const Key('addButton'));

    // Enter text
    await tester.enterText(textInput, 'Test Task');
    await tester.pump();

    // Tap add button
    await tester.tap(addButton);
    await tester.pump();

    // Verify task is added
    expect(find.text('Test Task'), findsOneWidget);
    expect(find.text('NO TASKS YET'), findsNothing);
  });

  testWidgets('Can toggle task completion', (WidgetTester tester) async {
    await tester.pumpWidget(SymmetryApp(themeController: ThemeController()));

    // Add a task first
    final textInput = find.byKey(const Key('textInput'));
    await tester.enterText(textInput, 'Toggle Test');
    await tester.pump();
    await tester.tap(find.byKey(const Key('addButton')));
    await tester.pump();

    // Tap the task to toggle it
    await tester.tap(find.text('Toggle Test'));
    await tester.pump();

    // Verify the DONE tag appears
    expect(find.text('DONE'), findsOneWidget);
  });

  testWidgets('Stats update when tasks are added', (WidgetTester tester) async {
    await tester.pumpWidget(SymmetryApp(themeController: ThemeController()));

    // Initially should show 0 active
    expect(find.text('0'), findsWidgets);

    // Add a task
    final textInput = find.byKey(const Key('textInput'));
    await tester.enterText(textInput, 'Stats Test');
    await tester.pump();
    await tester.tap(find.byKey(const Key('addButton')));
    await tester.pump();

    // Should now show 1 active
    expect(find.text('1'), findsWidgets);
  });
}
