# Flutter Automation Test App

A learning project demonstrating Flutter automation testing using **Patrol**, a powerful end-to-end testing framework for Flutter apps.

## Project Structure

```
flutter_automation_app/
├── lib/
│   └── main.dart              # Simple app with counter, text input, and reset
├── integration_test/
│   └── patrol_test.dart       # Patrol automation tests
└── pubspec.yaml               # Dependencies
```

## Features

The demo app includes:
- **Counter**: Increment/decrement buttons to learn basic interactions
- **Text Input**: TextField to learn text entry automation
- **Display Text**: Dynamic text that updates based on user input
- **Reset Button**: Resets all state to learn complex interactions

All widgets have semantic keys for easy automation targeting.

## Getting Started

### Prerequisites
- Flutter SDK installed
- Android emulator or iOS simulator running

### Installation

1. Install dependencies:
```bash
flutter pub get
```

2. Run the app on an emulator/simulator:
```bash
flutter run
```

## Running Automation Tests

### Run Patrol Tests

```bash
# Run all Patrol tests
patrol test

# Run specific test file
patrol test integration_test/patrol_test.dart

# Run with verbose output
patrol test --verbose
```

## Learning Patrol Concepts

### 1. **Finders** - Locating UI Elements
```dart
// Find by key
find.byKey(const Key('incrementButton'))

// Find by text
find.text('Increment')

// Find by type
find.byType(ElevatedButton)

// Find by icon
find.byIcon(Icons.refresh)
```

### 2. **Interactions** - Automating User Actions
```dart
// Tap a button
await $.tap(find.byKey(const Key('incrementButton')));

// Enter text
await $.enterText(find.byKey(const Key('textInput')), 'Hello');

// Long press
await $.longPress(find.byKey(const Key('someButton')));

// Drag
await $.drag(find.byType(Slider), const Offset(100, 0));
```

### 3. **Assertions** - Verifying State
```dart
// Widget exists
expect(find.text('Hello'), findsOneWidget);

// Widget doesn't exist
expect(find.text('Goodbye'), findsNothing);

// Multiple widgets
expect(find.byType(ElevatedButton), findsWidgets);
```

### 4. **Test Structure**
```dart
patrolTest(
  'Test description',
  ($) async {
    // 1. Pump the app
    await $.pumpWidgetAndSettle(const MyApp());
    
    // 2. Interact with UI
    await $.tap(find.byKey(const Key('button')));
    
    // 3. Assert results
    expect(find.text('Expected'), findsOneWidget);
  },
);
```

## Test Examples Included

### 1. Counter Increment Test
- Pumps the app
- Taps increment button 3 times
- Verifies counter shows "3"

### 2. Counter Decrement Test
- Increments to 5
- Decrements twice
- Verifies counter is 3

### 3. Text Input Test
- Enters text in TextField
- Taps update button
- Verifies display text changed

### 4. Reset Functionality Test
- Increments counter
- Enters text
- Taps reset button
- Verifies all state is reset

### 5. Multiple Interactions Test
- Demonstrates chaining multiple actions
- Increments counter and enters text
- Verifies both changes

## Tips for Learning

1. **Start Simple**: Begin with basic tap and text entry tests
2. **Use Keys**: Always add semantic keys to widgets you want to test
3. **Pump and Settle**: Use `$.pumpWidgetAndSettle()` to wait for animations
4. **Check Finders**: Use `find.byKey()` for reliable element location
5. **Read Logs**: Patrol provides detailed logs of test execution

## Resources

- [Patrol Documentation](https://patrol.leancode.co/documentation)
- [Patrol GitHub](https://github.com/leancodepl/patrol)
- [Flutter Testing Guide](https://flutter.dev/docs/testing)
- [Patrol Discord Community](https://discord.gg/patrol)

## Next Steps

1. Modify the app to add more UI elements
2. Write tests for those new elements
3. Explore native automation features in Patrol
4. Learn about test organization and best practices
5. Integrate tests into CI/CD pipeline

## Troubleshooting

### Tests not finding elements
- Ensure widgets have unique keys
- Use `find.byType()` as fallback
- Check widget hierarchy with Flutter DevTools

### Timeout errors
- Increase timeout in test configuration
- Use `$.pumpAndSettle()` to wait for animations
- Check for infinite loops in your app

### Emulator/Simulator issues
- Ensure device is running and responsive
- Try `flutter devices` to list available devices
- Restart emulator if tests hang

---

Happy testing! 🚀
