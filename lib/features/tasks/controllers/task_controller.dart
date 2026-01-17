import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/task.dart';

/// Task Controller
///
/// Manages all business logic for task operations.
/// Follows the Controller pattern in MVC architecture.
class TaskController extends ChangeNotifier {
  final List<Task> _tasks = [];
  int _taskIdCounter = 0;

  // ═══════════════════════════════════════════════════════════════════════════
  // GETTERS
  // ═══════════════════════════════════════════════════════════════════════════

  /// Get all tasks
  List<Task> get tasks => List.unmodifiable(_tasks);

  /// Get count of active (incomplete) tasks
  int get activeCount => _tasks.where((task) => !task.isCompleted).length;

  /// Get count of completed tasks
  int get completedCount => _tasks.where((task) => task.isCompleted).length;

  /// Get total number of tasks
  int get totalCount => _tasks.length;

  /// Get progress percentage (0-100)
  double get progressPercentage =>
      _tasks.isEmpty ? 0 : (completedCount / _tasks.length) * 100;

  /// Check if there are any tasks
  bool get hasTasks => _tasks.isNotEmpty;

  /// Check if there are completed tasks
  bool get hasCompletedTasks => completedCount > 0;

  // ═══════════════════════════════════════════════════════════════════════════
  // TASK OPERATIONS
  // ═══════════════════════════════════════════════════════════════════════════

  /// Add a new task
  void addTask(String title) {
    if (title.trim().isEmpty) return;

    HapticFeedback.mediumImpact();
    _tasks.insert(0, Task(id: 'task_$_taskIdCounter', title: title.trim()));
    _taskIdCounter++;
    notifyListeners();
  }

  /// Toggle task completion status
  void toggleTask(int index) {
    if (index < 0 || index >= _tasks.length) return;

    HapticFeedback.lightImpact();
    _tasks[index].isCompleted = !_tasks[index].isCompleted;
    notifyListeners();
  }

  /// Delete a task by index
  void deleteTask(int index) {
    if (index < 0 || index >= _tasks.length) return;

    HapticFeedback.heavyImpact();
    _tasks.removeAt(index);
    notifyListeners();
  }

  /// Clear all completed tasks
  void clearCompleted() {
    HapticFeedback.heavyImpact();
    _tasks.removeWhere((task) => task.isCompleted);
    notifyListeners();
  }

  /// Update task title
  void updateTaskTitle(int index, String newTitle) {
    if (index < 0 || index >= _tasks.length) return;
    if (newTitle.trim().isEmpty) return;

    _tasks[index].title = newTitle.trim();
    notifyListeners();
  }

  /// Get task by index
  Task? getTask(int index) {
    if (index < 0 || index >= _tasks.length) return null;
    return _tasks[index];
  }
}
