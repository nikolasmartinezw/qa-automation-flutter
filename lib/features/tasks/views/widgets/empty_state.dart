import 'package:flutter/material.dart';
import '../../../../core/theme/symmetry_colors.dart';

/// Empty State Widget
///
/// Displayed when there are no tasks.
class EmptyState extends StatelessWidget {
  final Animation<double> floatAnimation;

  const EmptyState({Key? key, required this.floatAnimation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: floatAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, floatAnimation.value * 0.5),
          child: child,
        );
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: SymmetryColors.mediumGray, width: 2),
              ),
              child: const Icon(
                Icons.check_circle_outline_rounded,
                size: 60,
                color: SymmetryColors.mediumGray,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'NO TASKS YET',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: SymmetryColors.dimGray,
                letterSpacing: 4,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Add your first task to get started',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: SymmetryColors.accentDim,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
