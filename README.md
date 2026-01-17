# Automation Lab

A stunning Flutter task management application with premium glassmorphism design and smooth animations. Built to demonstrate advanced automation testing capabilities using **Patrol**.

## Features

**Task Management:**
- ✅ Add tasks with a sleek input field
- ✅ Mark tasks as complete with tap interaction
- ✅ Swipe to delete tasks (swipe left)
- ✅ Clear all completed tasks at once
- ✅ Real-time statistics (Active & Done counts)
- ✅ Empty state with elegant placeholder

**Visual Design:**
- Animated rotating background circles
- Glassmorphic cards with blur effects
- Gradient text and icons
- Neon button glows
- Smooth bouncy scrolling
- Strike-through completed tasks

All interactive elements have semantic keys for reliable automation testing.

## Project Structure

```
flutter_automation_app/
├── lib/
│   └── main.dart              # Task manager app with glassmorphism UI
├── integration_test/
│   └── patrol_test.dart       # Patrol automation tests
└── pubspec.yaml               # Dependencies
```

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

## Design Elements

### Color Palette
- **Background**: `#0A0E27` → `#1A1F3A` (Dark navy gradient)
- **Primary Blue**: `#00D4FF` (Cyan blue)
- **Secondary Blue**: `#0EA5E9` (Sky blue)
- **Glass Effect**: White with 5-10% opacity
- **Text**: White with varying opacity

### UI Components
- **Glass Cards**: Frosted glass with blur and subtle borders
- **Gradient Buttons**: Cyan to blue with neon glow shadows
- **Animated Background**: Rotating gradient circles
- **Stats Cards**: Real-time task counters with icons
- **Task Items**: Swipeable cards with completion states

### Interactions
- **Tap**: Toggle task completion
- **Swipe Left**: Delete task
- **Enter Key**: Submit new task
- **Tap Add Button**: Add new task
- **Tap Clear**: Remove all completed tasks

## Learning Patrol Concepts

### 1. **Finders** - Locating UI Elements
```dart
// Find by key
find.byKey(const Key('addButton'))

// Find by text
find.text('Test automation task')

// Find by type
find.byType(ListView)
```

### 2. **Interactions** - Automating User Actions
```dart
// Enter text
await $.enterText(find.byKey(const Key('textInput')), 'New task');

// Tap button
await $.tap(find.byKey(const Key('addButton')));

// Tap text
await $.tap(find.text('Task name'));
```

### 3. **Assertions** - Verifying State
```dart
// Widget exists
expect(find.text('Task name'), findsOneWidget);

// Widget doesn't exist
expect(find.text('Deleted task'), findsNothing);

// Multiple widgets
expect(find.text('0'), findsNWidgets(2));
```

### 4. **Test Structure**
```dart
patrolTest(
  'Add task test',
  ($) async {
    // 1. Pump the app
    await $.pumpWidgetAndSettle(const MyApp());
    
    // 2. Interact with UI
    await $.enterText(find.byKey(const Key('textInput')), 'Task');
    await $.tap(find.byKey(const Key('addButton')));
    
    // 3. Assert results
    expect(find.text('Task'), findsOneWidget);
  },
);
```

## Test Examples Included

### 1. Add Task Test
- Verifies initial empty state
- Adds a new task
- Confirms task appears in list

### 2. Complete Task Test
- Adds a task
- Taps to mark as complete
- Verifies completion counter updates

### 3. Add Multiple Tasks Test
- Adds three different tasks
- Verifies all tasks are visible

### 4. Clear Completed Tasks Test
- Adds multiple tasks
- Completes some tasks
- Clears completed tasks
- Verifies only active tasks remain

### 5. Task Interaction Flow Test
- Tests complete user workflow
- Verifies UI state changes

## Tips for Learning

1. **Start Simple**: Begin with adding and completing tasks
2. **Use Keys**: All interactive elements have semantic keys
3. **Pump and Settle**: Use `$.pumpWidgetAndSettle()` for animations
4. **Test User Flows**: Combine multiple actions to test real scenarios
5. **Verify State**: Check counters and task visibility

## Resources

- [Patrol Documentation](https://patrol.leancode.co/documentation)
- [Patrol GitHub](https://github.com/leancodepl/patrol)
- [Flutter Testing Guide](https://flutter.dev/docs/testing)
- [Patrol Discord Community](https://discord.gg/patrol)

## Next Steps

1. Add task editing functionality
2. Implement task categories or tags
3. Add persistence with local storage
4. Create more complex test scenarios
5. Integrate tests into CI/CD pipeline

## Troubleshooting

### Tests not finding elements
- Ensure widgets have unique keys
- Use `find.byType()` as fallback
- Check widget hierarchy with Flutter DevTools

### Animation issues
- Use `$.pumpAndSettle()` to wait for animations
- Increase timeout if needed
- Check for infinite animation loops

### Emulator/Simulator issues
- Ensure device is running and responsive
- Try `flutter devices` to list available devices
- Restart emulator if tests hang

---

Built with precision, style, and attention to detail. 🚀✨
