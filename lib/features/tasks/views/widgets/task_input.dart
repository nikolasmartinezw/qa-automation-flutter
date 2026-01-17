import 'package:flutter/material.dart';
import '../../../../core/theme/symmetry_colors.dart';

/// Task Input Widget
///
/// Text field for adding new tasks with animated styling.
class TaskInput extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback onSubmit;
  final bool isInputFocused;

  const TaskInput({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.onSubmit,
    required this.isInputFocused,
  }) : super(key: key);

  @override
  State<TaskInput> createState() => _TaskInputState();
}

class _TaskInputState extends State<TaskInput> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasText = widget.controller.text.isNotEmpty;
    final isActive = hasText || widget.isInputFocused;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        decoration: BoxDecoration(
          color: isDark ? SymmetryColors.charcoal : SymmetryColors.offWhite,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: widget.isInputFocused
                ? (isDark ? SymmetryColors.white : SymmetryColors.black)
                : (isDark ? SymmetryColors.mediumGray : SymmetryColors.silver),
            width: widget.isInputFocused ? 2 : 1,
          ),
          boxShadow: widget.isInputFocused
              ? [
                  BoxShadow(
                    color:
                        (isDark ? SymmetryColors.white : SymmetryColors.black)
                            .withOpacity(0.1),
                    blurRadius: 30,
                    offset: const Offset(0, 10),
                  ),
                ]
              : null,
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                key: const Key('textInput'),
                controller: widget.controller,
                focusNode: widget.focusNode,
                style: TextStyle(
                  color: isDark ? SymmetryColors.white : SymmetryColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
                decoration: InputDecoration(
                  hintText: 'Add a new task...',
                  hintStyle: TextStyle(
                    color: SymmetryColors.dimGray,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 20,
                  ),
                ),
                onSubmitted: (_) => widget.onSubmit(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: GestureDetector(
                key: const Key('addButton'),
                onTap: widget.onSubmit,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: isActive
                        ? (isDark ? SymmetryColors.white : SymmetryColors.black)
                        : (isDark
                              ? SymmetryColors.mediumGray
                              : SymmetryColors.silver),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(
                    Icons.add_rounded,
                    color: isActive
                        ? (isDark ? SymmetryColors.black : SymmetryColors.white)
                        : SymmetryColors.dimGray,
                    size: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
