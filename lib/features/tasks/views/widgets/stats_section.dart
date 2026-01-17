import 'package:flutter/material.dart';
import '../../../../core/theme/symmetry_colors.dart';

/// Stats Section Widget
///
/// Displays task statistics: active count, completed count, and progress.
class StatsSection extends StatelessWidget {
  final int activeCount;
  final int completedCount;
  final double progressPercentage;
  final int totalTasks;

  const StatsSection({
    Key? key,
    required this.activeCount,
    required this.completedCount,
    required this.progressPercentage,
    required this.totalTasks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: [
          Expanded(
            child: _StatCard(
              label: 'ACTIVE',
              value: activeCount.toString(),
              icon: Icons.radio_button_unchecked,
              isHighlighted: true,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _StatCard(
              label: 'COMPLETED',
              value: completedCount.toString(),
              icon: Icons.check_circle_outline,
              isHighlighted: false,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _ProgressCard(
              progressPercentage: progressPercentage,
              totalTasks: totalTasks,
              completedCount: completedCount,
            ),
          ),
        ],
      ),
    );
  }
}

/// Individual Stat Card
class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final bool isHighlighted;

  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.isHighlighted,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final Gradient? bgGradient = isHighlighted
        ? (isDark
              ? SymmetryColors.cardGradient
              : SymmetryColors.primaryGradient)
        : null;

    final Color? bgColor = isHighlighted
        ? null
        : (isDark ? SymmetryColors.charcoal : SymmetryColors.offWhite);

    final textColor = isHighlighted
        ? (isDark ? SymmetryColors.white : SymmetryColors.black)
        : (isDark ? SymmetryColors.white : SymmetryColors.black);

    final borderColor = isHighlighted
        ? (isDark
              ? SymmetryColors.mediumGray
              : SymmetryColors.lightGray.withOpacity(0.5))
        : (isDark ? SymmetryColors.mediumGray : SymmetryColors.lightGray);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: bgColor,
        gradient: bgGradient,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor, width: 1),
        boxShadow: isHighlighted
            ? [
                BoxShadow(
                  color: (isDark ? SymmetryColors.white : SymmetryColors.black)
                      .withOpacity(0.15),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
              ]
            : null,
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: isHighlighted ? textColor : SymmetryColors.silver,
            size: 20,
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: textColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w700,
              color: SymmetryColors.dimGray,
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

/// Progress Card with circular indicator
class _ProgressCard extends StatelessWidget {
  final double progressPercentage;
  final int totalTasks;
  final int completedCount;

  const _ProgressCard({
    required this.progressPercentage,
    required this.totalTasks,
    required this.completedCount,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark
              ? [SymmetryColors.darkGray, SymmetryColors.charcoal]
              : [SymmetryColors.offWhite, SymmetryColors.lightGray],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark ? SymmetryColors.mediumGray : SymmetryColors.lightGray,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              value: totalTasks == 0 ? 0 : completedCount / totalTasks,
              strokeWidth: 3,
              backgroundColor: isDark
                  ? SymmetryColors.accentDim
                  : SymmetryColors.silver,
              valueColor: AlwaysStoppedAnimation<Color>(
                isDark ? SymmetryColors.white : SymmetryColors.black,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${progressPercentage.toInt()}%',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: isDark ? SymmetryColors.white : SymmetryColors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'PROGRESS',
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w700,
              color: SymmetryColors.dimGray,
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
