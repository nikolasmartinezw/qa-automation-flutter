import 'package:flutter/material.dart';
import '../../../shared/widgets/animated_background.dart';
import '../../../../core/theme/theme_controller.dart';
import '../controllers/task_controller.dart';
import 'widgets/header_widget.dart';
import 'widgets/stats_section.dart';
import 'widgets/task_input.dart';
import 'widgets/task_list.dart';
import 'widgets/empty_state.dart';
import 'widgets/clear_button.dart';

/// Home Page
///
/// Main page of the Patrol QA App.
/// Follows MVC pattern with TaskController handling business logic.
class HomePage extends StatefulWidget {
  final ThemeController themeController;

  const HomePage({Key? key, required this.themeController}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  // Controller
  final TaskController _taskController = TaskController();

  // Text input
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isInputFocused = false;

  // Animations
  late AnimationController _pulseController;
  late AnimationController _floatController;
  late Animation<double> _pulseAnimation;
  late Animation<double> _floatAnimation;

  @override
  void initState() {
    super.initState();
    _initAnimations();
    _setupListeners();
  }

  void _initAnimations() {
    _pulseController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _floatController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 0.3, end: 0.6).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _floatAnimation = Tween<double>(begin: -15, end: 15).animate(
      CurvedAnimation(parent: _floatController, curve: Curves.easeInOut),
    );
  }

  void _setupListeners() {
    _focusNode.addListener(() {
      setState(() => _isInputFocused = _focusNode.hasFocus);
    });

    _taskController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    _pulseController.dispose();
    _floatController.dispose();
    _focusNode.dispose();
    _taskController.dispose();
    super.dispose();
  }

  void _handleAddTask() {
    _taskController.addTask(_textController.text);
    _textController.clear();
    _focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Animated Background
          AnimatedBackground(
            pulseAnimation: _pulseAnimation,
            floatAnimation: _floatAnimation,
            // We can pass theme awareness if needed, but it checks context now
          ),

          // Main Content
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 24),
                HeaderWidget(
                  onToggleTheme: widget.themeController.toggleTheme,
                  isDark: widget.themeController.isDark,
                ),
                const SizedBox(height: 32),
                StatsSection(
                  activeCount: _taskController.activeCount,
                  completedCount: _taskController.completedCount,
                  progressPercentage: _taskController.progressPercentage,
                  totalTasks: _taskController.totalCount,
                ),
                const SizedBox(height: 24),
                TaskInput(
                  controller: _textController,
                  focusNode: _focusNode,
                  onSubmit: _handleAddTask,
                  isInputFocused: _isInputFocused,
                ),
                const SizedBox(height: 24),
                Expanded(child: _buildContent()),
                if (_taskController.hasCompletedTasks)
                  ClearButton(onPressed: _taskController.clearCompleted),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    if (!_taskController.hasTasks) {
      return EmptyState(floatAnimation: _floatAnimation);
    }

    return TaskList(
      tasks: _taskController.tasks,
      onToggle: _taskController.toggleTask,
      onDelete: _taskController.deleteTask,
    );
  }
}
