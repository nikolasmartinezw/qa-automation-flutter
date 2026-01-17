import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:flutter_automation_app/app.dart';
import 'package:flutter_automation_app/core/theme/theme_controller.dart';

void main() {
  patrolTest('Add task test', ($) async {
    await $.pumpWidgetAndSettle(
      SymmetryApp(themeController: ThemeController()),
    );

    // Verify initial state
    expect(find.text('NO TASKS YET'), findsOneWidget);

    // Add a task
    await $.enterText(
      find.byKey(const Key('textInput')),
      'Test automation task',
    );
    await $.tap(find.byKey(const Key('addButton')));

    // Verify task was added
    expect(find.text('Test automation task'), findsOneWidget);
  });

  patrolTest('Complete task test', ($) async {
    await $.pumpWidgetAndSettle(
      SymmetryApp(themeController: ThemeController()),
    );

    // Add a task
    await $.enterText(find.byKey(const Key('textInput')), 'Complete this task');
    await $.tap(find.byKey(const Key('addButton')));

    // Tap on the task to complete it
    await $.tap(find.text('Complete this task'));

    // Verify task shows DONE tag
    expect(find.text('DONE'), findsOneWidget);
  });

  patrolTest('Add multiple tasks test', ($) async {
    await $.pumpWidgetAndSettle(
      SymmetryApp(themeController: ThemeController()),
    );

    // Add first task
    await $.enterText(find.byKey(const Key('textInput')), 'First task');
    await $.tap(find.byKey(const Key('addButton')));

    // Add second task
    await $.enterText(find.byKey(const Key('textInput')), 'Second task');
    await $.tap(find.byKey(const Key('addButton')));

    // Add third task
    await $.enterText(find.byKey(const Key('textInput')), 'Third task');
    await $.tap(find.byKey(const Key('addButton')));

    // Verify all tasks are present
    expect(find.text('First task'), findsOneWidget);
    expect(find.text('Second task'), findsOneWidget);
    expect(find.text('Third task'), findsOneWidget);
  });

  patrolTest('Clear completed tasks test', ($) async {
    await $.pumpWidgetAndSettle(
      SymmetryApp(themeController: ThemeController()),
    );

    // Add two tasks
    await $.enterText(find.byKey(const Key('textInput')), 'Task to complete');
    await $.tap(find.byKey(const Key('addButton')));

    await $.enterText(find.byKey(const Key('textInput')), 'Task to keep');
    await $.tap(find.byKey(const Key('addButton')));

    // Complete first task
    await $.tap(find.text('Task to complete'));

    // Clear completed tasks
    await $.tap(find.byKey(const Key('clearButton')));

    // Verify only active task remains
    expect(find.text('Task to complete'), findsNothing);
    expect(find.text('Task to keep'), findsOneWidget);
  });

  patrolTest('Task interaction flow test', ($) async {
    await $.pumpWidgetAndSettle(
      SymmetryApp(themeController: ThemeController()),
    );

    // Add a task
    await $.enterText(find.byKey(const Key('textInput')), 'Automation test');
    await $.tap(find.byKey(const Key('addButton')));

    // Verify task appears
    expect(find.text('Automation test'), findsOneWidget);

    // Complete the task
    await $.tap(find.text('Automation test'));

    // Verify clear button appears
    expect(find.byKey(const Key('clearButton')), findsOneWidget);
  });
}
