import 'package:flutter/material.dart';

/// Symmetry Club Brand Color Palette
///
/// A minimal, premium black & white design system
/// inspired by the geometric Symmetry Club logo.
class SymmetryColors {
  SymmetryColors._();

  // ═══════════════════════════════════════════════════════════════════════════
  // PRIMARY - Pure Black Scale
  // ═══════════════════════════════════════════════════════════════════════════
  static const Color black = Color(0xFF000000);
  static const Color richBlack = Color(0xFF0A0A0A);
  static const Color charcoal = Color(0xFF121212);
  static const Color darkGray = Color(0xFF1A1A1A);
  static const Color mediumGray = Color(0xFF2A2A2A);

  // ═══════════════════════════════════════════════════════════════════════════
  // SECONDARY - White & Gray Scale
  // ═══════════════════════════════════════════════════════════════════════════
  static const Color white = Color(0xFFFFFFFF);
  static const Color offWhite = Color(0xFFF5F5F5);
  static const Color lightGray = Color(0xFFE0E0E0);
  static const Color silver = Color(0xFFB0B0B0);
  static const Color dimGray = Color(0xFF707070);

  // ═══════════════════════════════════════════════════════════════════════════
  // ACCENTS - Subtle Highlights
  // ═══════════════════════════════════════════════════════════════════════════
  static const Color accent = Color(0xFFE8E8E8);
  static const Color accentDim = Color(0xFF404040);

  // ═══════════════════════════════════════════════════════════════════════════
  // GRADIENTS
  // ═══════════════════════════════════════════════════════════════════════════
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [white, lightGray],
  );

  static const LinearGradient darkGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [richBlack, black],
  );

  static const LinearGradient cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1A1A1A), Color(0xFF0F0F0F)],
  );
}
