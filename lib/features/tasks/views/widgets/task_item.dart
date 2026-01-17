import 'package:flutter/material.dart';
import '../../../../core/theme/symmetry_colors.dart';
import '../../models/task.dart';

/// Task Item Widget
///
/// Displays a single task with animations for toggle and delete.
class TaskItem extends StatefulWidget {
  final Task task;
  final int index;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  const TaskItem({
    Key? key,
    required this.task,
    required this.index,
    required this.onToggle,
    required this.onDelete,
  }) : super(key: key);

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.97).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Dismissible(
        key: Key(widget.task.id),
        direction: DismissDirection.endToStart,
        onDismissed: (_) => widget.onDelete(),
        background: Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 24),
          decoration: BoxDecoration(
            color: Colors.red.shade900.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.red.shade900.withOpacity(0.5),
              width: 1,
            ),
          ),
          child: Icon(
            Icons.delete_outline_rounded,
            color: Colors.red.shade400,
            size: 28,
          ),
        ),
        child: GestureDetector(
          onTapDown: (_) => _scaleController.forward(),
          onTapUp: (_) {
            _scaleController.reverse();
            widget.onToggle();
          },
          onTapCancel: () => _scaleController.reverse(),
          child: AnimatedBuilder(
            animation: _scaleController,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimation.value,
                child: child,
              );
            },
            child: _buildTaskCard(),
          ),
        ),
      ),
    );
  }

  Widget _buildTaskCard() {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: widget.task.isCompleted
            ? (isDark
                  ? SymmetryColors.charcoal.withOpacity(0.5)
                  : SymmetryColors.offWhite.withOpacity(0.5))
            : (isDark ? SymmetryColors.charcoal : SymmetryColors.offWhite),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: widget.task.isCompleted
              ? (isDark
                    ? SymmetryColors.mediumGray.withOpacity(0.3)
                    : SymmetryColors.silver.withOpacity(0.3))
              : (isDark ? SymmetryColors.mediumGray : SymmetryColors.silver),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          _buildCheckbox(isDark),
          const SizedBox(width: 16),
          Expanded(child: _buildTitle(isDark)),
          _buildDoneTag(isDark),
        ],
      ),
    );
  }

  Widget _buildCheckbox(bool isDark) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutBack,
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: widget.task.isCompleted
            ? (isDark ? SymmetryColors.white : SymmetryColors.black)
            : Colors.transparent,
        border: Border.all(
          color: widget.task.isCompleted
              ? (isDark ? SymmetryColors.white : SymmetryColors.black)
              : SymmetryColors.dimGray,
          width: 2,
        ),
      ),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: widget.task.isCompleted ? 1.0 : 0.0,
        child: Icon(
          Icons.check_rounded,
          color: isDark ? SymmetryColors.black : SymmetryColors.white,
          size: 18,
        ),
      ),
    );
  }

  Widget _buildTitle(bool isDark) {
    return AnimatedDefaultTextStyle(
      duration: const Duration(milliseconds: 200),
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: widget.task.isCompleted
            ? SymmetryColors.dimGray
            : (isDark ? SymmetryColors.white : SymmetryColors.black),
        decoration: widget.task.isCompleted ? TextDecoration.lineThrough : null,
        decorationColor: SymmetryColors.dimGray,
        letterSpacing: 0.3,
      ),
      child: Text(widget.task.title),
    );
  }

  Widget _buildDoneTag(bool isDark) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: widget.task.isCompleted ? 1.0 : 0.0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: isDark
              ? SymmetryColors.mediumGray.withOpacity(0.5)
              : SymmetryColors.lightGray.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          'DONE',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: SymmetryColors.dimGray,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}
