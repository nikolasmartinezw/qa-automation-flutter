/// Task Model
///
/// Represents a single task item in the todo list.
class Task {
  /// Unique identifier for the task
  final String id;

  /// Title/description of the task
  String title;

  /// Whether the task has been completed
  bool isCompleted;

  /// Timestamp when the task was created
  final DateTime createdAt;

  Task({required this.id, required this.title, this.isCompleted = false})
    : createdAt = DateTime.now();

  /// Creates a copy of the task with optional modifications
  Task copyWith({String? id, String? title, bool? isCompleted}) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
