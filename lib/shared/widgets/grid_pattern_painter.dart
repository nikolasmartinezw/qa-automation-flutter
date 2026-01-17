import 'package:flutter/material.dart';
import '../../core/theme/symmetry_colors.dart';

/// Grid Pattern Custom Painter
///
/// Creates a subtle grid pattern overlay for the background.
class GridPatternPainter extends CustomPainter {
  /// Opacity of the grid lines (0.0 - 1.0)
  final double opacity;

  /// Spacing between grid lines
  final double spacing;

  /// Color of the grid lines
  final Color color;

  GridPatternPainter({
    required this.opacity,
    this.spacing = 60.0,
    this.color = SymmetryColors.white,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withOpacity(opacity)
      ..strokeWidth = 0.5;

    // Draw vertical lines
    for (double x = 0; x < size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    // Draw horizontal lines
    for (double y = 0; y < size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant GridPatternPainter oldDelegate) {
    return oldDelegate.opacity != opacity || oldDelegate.spacing != spacing;
  }
}
