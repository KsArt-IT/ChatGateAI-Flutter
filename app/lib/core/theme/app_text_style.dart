import 'package:chat_gate_ai/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

abstract final class AppTextStyles {
  static TextStyle get display => const TextStyle(
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w500,
    fontSize: 32,
    height: 1.0,
    letterSpacing: 0.0,
  );

  static TextStyle get headline => const TextStyle(
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w500,
    fontSize: 24,
    height: 1.3,
    letterSpacing: 0.0,
  );

  static TextStyle get title => const TextStyle(
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w500,
    fontSize: 32,
    height: 1.4,
    letterSpacing: 0.0,
  );

  static TextStyle get body => const TextStyle(
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 1.0,
    letterSpacing: 0.0,
  );

  static TextStyle get label => const TextStyle(
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 1.0,
    letterSpacing: 0.0,
  );
}
