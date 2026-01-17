import 'package:flutter/material.dart';
import '../../models/task.dart';
import 'task_item.dart';

/// Task List Widget
///
/// Displays a scrollable list of task items.
class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final Function(int) onToggle;
  final Function(int) onDelete;

  const TaskList({
    Key? key,
    required this.tasks,
    required this.onToggle,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: const Key('taskList'),
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskItem(
          task: tasks[index],
          index: index,
          onToggle: () => onToggle(index),
          onDelete: () => onDelete(index),
        );
      },
    );
  }
}
