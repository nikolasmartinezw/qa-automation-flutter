import 'package:flutter/material.dart';
import '../../../../core/theme/symmetry_colors.dart';

/// Clear Completed Button Widget
///
/// Button to clear all completed tasks.
class ClearButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ClearButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color = isDark ? SymmetryColors.white : SymmetryColors.black;

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
      child: GestureDetector(
        key: const Key('clearButton'),
        onTap: onPressed,
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: color.withOpacity(0.3), width: 1.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.delete_sweep_outlined,
                color: color.withOpacity(0.8),
                size: 22,
              ),
              const SizedBox(width: 12),
              Text(
                'CLEAR COMPLETED',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: color.withOpacity(0.8),
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
