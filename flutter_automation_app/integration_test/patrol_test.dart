import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:flutter_automation_app/main.dart';

void main() {
  patrolTest(
    'Counter increment test',
    ($) async {
      await $.pumpWidgetAndSettle(const MyApp());
      expect(find.text('0'), findsOneWidget);

      await $.tap(find.byKey(const Key('incrementButton')));
      await $.tap(find.byKey(const Key('incrementButton')));
      await $.tap(find.byKey(const Key('incrementButton')));

      expect(find.text('3'), findsOneWidget);
    },
  );

  patrolTest(
    'Counter decrement test',
    ($) async {
      await $.pumpWidgetAndSettle(const MyApp());

      for (int i = 0; i < 5; i++) {
        await $.tap(find.byKey(const Key('incrementButton')));
      }

      expect(find.text('5'), findsOneWidget);

      await $.tap(find.byKey(const Key('decrementButton')));
      await $.tap(find.byKey(const Key('decrementButton')));

      expect(find.text('3'), findsOneWidget);
    },
  );

  patrolTest(
    'Text input and update test',
    ($) async {
      await $.pumpWidgetAndSettle(const MyApp());

      expect(find.text('Hello, Automation!'), findsOneWidget);

      await $.enterText(
        find.byKey(const Key('textInput')),
        'Patrol is awesome!',
      );

      await $.tap(find.byKey(const Key('updateButton')));

      expect(find.text('Patrol is awesome!'), findsOneWidget);
    },
  );

  patrolTest(
    'Reset all functionality test',
    ($) async {
      await $.pumpWidgetAndSettle(const MyApp());

      await $.tap(find.byKey(const Key('incrementButton')));
      await $.tap(find.byKey(const Key('incrementButton')));

      await $.enterText(
        find.byKey(const Key('textInput')),
        'Test text',
      );

      await $.tap(find.byKey(const Key('updateButton')));

      expect(find.text('2'), findsOneWidget);
      expect(find.text('Test text'), findsOneWidget);

      await $.tap(find.byKey(const Key('resetButton')));

      expect(find.text('0'), findsOneWidget);
      expect(find.text('Hello, Automation!'), findsOneWidget);
    },
  );

  patrolTest(
    'Multiple interactions in sequence',
    ($) async {
      await $.pumpWidgetAndSettle(const MyApp());

      await $.tap(find.byKey(const Key('incrementButton')));
      await $.tap(find.byKey(const Key('incrementButton')));

      expect(find.text('2'), findsOneWidget);

      await $.enterText(
        find.byKey(const Key('textInput')),
        'Multiple interactions',
      );

      await $.tap(find.byKey(const Key('updateButton')));

      expect(find.text('Multiple interactions'), findsOneWidget);
    },
  );
}
