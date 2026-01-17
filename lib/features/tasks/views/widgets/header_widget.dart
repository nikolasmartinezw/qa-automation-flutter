import 'package:flutter/material.dart';
import '../../../../core/theme/symmetry_colors.dart';

/// Header Widget
///
/// Displays the Symmetry Club branding and app title.
class HeaderWidget extends StatelessWidget {
  final VoidCallback onToggleTheme;
  final bool isDark;

  const HeaderWidget({
    Key? key,
    required this.onToggleTheme,
    required this.isDark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: [
          // Logo - Symmetry S (inverted colors)
          GestureDetector(
            onTap: onToggleTheme,
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: SymmetryColors.black,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: SymmetryColors.white, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: SymmetryColors.white.withOpacity(0.15),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  'S',
                  style: TextStyle(
                    color: SymmetryColors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SYMMETRY CLUB',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 4,
                    color: isDark ? SymmetryColors.white : SymmetryColors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'QA Automation Showcase',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: SymmetryColors.dimGray,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onToggleTheme,
            icon: Icon(
              isDark ? Icons.light_mode : Icons.dark_mode,
              color: isDark ? SymmetryColors.white : SymmetryColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
