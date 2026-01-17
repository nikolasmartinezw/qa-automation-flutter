import 'package:flutter/material.dart';
import '../../core/theme/symmetry_colors.dart';
import 'grid_pattern_painter.dart';

/// Animated Background Widget
///
/// Creates a dynamic background with floating glows and grid pattern.
class AnimatedBackground extends StatelessWidget {
  final Animation<double> pulseAnimation;
  final Animation<double> floatAnimation;

  const AnimatedBackground({
    Key? key,
    required this.pulseAnimation,
    required this.floatAnimation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final effectColor = isDark ? SymmetryColors.white : SymmetryColors.black;

    return AnimatedBuilder(
      animation: Listenable.merge([pulseAnimation, floatAnimation]),
      builder: (context, _) {
        return Stack(
          children: [
            // Top-right glow
            Positioned(
              top: -100 + floatAnimation.value,
              right: -80,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      effectColor.withOpacity(0.03 * pulseAnimation.value),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            // Bottom-left glow
            Positioned(
              bottom: -120 - floatAnimation.value,
              left: -100,
              child: Container(
                width: 350,
                height: 350,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      effectColor.withOpacity(0.02 * pulseAnimation.value),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            // Subtle grid pattern
            Positioned.fill(
              child: CustomPaint(
                painter: GridPatternPainter(opacity: 0.03, color: effectColor),
              ),
            ),
          ],
        );
      },
    );
  }
}
