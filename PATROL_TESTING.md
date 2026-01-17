# Patrol Testing Guide

This document explains how **Patrol** is integrated into the **Patrol QA App** for robust UI and integration testing.

## 🚀 What is Patrol?
Patrol is an advanced testing framework for Flutter that extends standard integration testing capabilities. It offers two main advantages:
1.  **Native Automation**: Ability to interact with native platform features (permissions, notifications, settings, other apps) which standard Flutter tests cannot access.
2.  **Smart Finders**: A concise, reliable, and async-await driven syntax (customary `$` syntax) that reduces flakiness by automatically waiting for elements to appear.

## 🛠️ Prerequisites

To run the tests, you need the **Patrol CLI** installed on your machine.

1.  **Install Patrol CLI**:
    ```bash
    dart pub global activate patrol_cli
    ```

2.  **Verify Installation**:
    ```bash
    patrol doctor
    ```
    This command checks if your environment (Android SDK, Xcode, etc.) is correctly set up for native automation.

    > **Windows Users**: If you get a "Command not found" error, you need to add the Pub Cache bin to your PATH.
    > Run this in PowerShell to fix it for the current session:
    > ```powershell
    > $env:Path += ";$env:LOCALAPPDATA\Pub\Cache\bin"
    > ```

## ⚙️ Configuration

The project is already configured for Patrol in `pubspec.yaml`.

### **`pubspec.yaml` Setup**
We have added the `patrol` dependency and a configuration section:
```yaml
dev_dependencies:
  patrol: ^3.0.0

patrol:
  app_name: Automation Lab
  package_name: com.example.flutter_automation_app
  android:
    package_name: com.example.flutter_automation_app
  ios:
    bundle_id: com.example.flutterAutomationApp
```
*   **package_name**: Critical for Patrol to identify the app process on the device during native automation steps.

### **Native Splash Screen**
The app also uses `flutter_native_splash`. If you need to regenerate the splash screen:
```bash
dart run flutter_native_splash:create
```

## 🏃 Running Tests

To run the integration tests on a connected device or emulator:

```bash
patrol test --target integration_test/patrol_test.dart
```

### **Command Breakdown**
*   `patrol test`: Builds the app and the test driver.
*   `--target`: Specifies the entry point for the test.

**Note**: Standard `flutter test integration_test/patrol_test.dart` might fail or behave unexpectedly because it lacks the native bridge that `patrol test` establishes.

## 🧪 Test Structure

The main test file is located at `integration_test/patrol_test.dart`.

 it covers the following scenarios:
*   **Add Task**: Verifies a task can be typed in and added to the list.
*   **Complete Task**: Taps a task to mark it as DONE.
*   **Add Multiple Tasks**: Ensures the list handles multiple items.
*   **Clear Completed**: verifies that the "Clear Completed" button removes finished tasks.
*   **Task Interaction**: Checks the full flow of adding, completing, and clearing.

**Example Test Snippet**:
```dart
patrolTest(
  'Add task test',
  ($) async {
    // Pump the specific App widget with dependencies injected
    await $.pumpWidgetAndSettle(SymmetryApp(themeController: ThemeController()));

    // Use smart finders to enter text
    await $.enterText(
      find.byKey(const Key('textInput')),
      'Test automation task',
    );
    
    // Tap button and await settlement automatically
    await $.tap(find.byKey(const Key('addButton')));

    // Assert result
    expect(find.text('Test automation task'), findsOneWidget);
  },
);
```

## ❓ Troubleshooting

### **"Binding is already initialized" Error**
If you see an error like `Binding is already initialized to IntegrationTestWidgetsFlutterBinding`, verify that:
1.  You are running `patrol test`, not `flutter test` or `flutter drive`.
2.  You are not importing conflicting bindings in other test files.
3.  `flutter_test` imports are managed correctly (Patrol exports most test utilities, but explicit imports are sometimes needed for `expect`).

### **App Stuck on Splash Screen**
If the test hangs at start:
*   Ensure the `package_name` in `pubspec.yaml` matches exactly what is in `android/app/build.gradle`.
*   Run `patrol doctor` to check for ADB or connection issues.
