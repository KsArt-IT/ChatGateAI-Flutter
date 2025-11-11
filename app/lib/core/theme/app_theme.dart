import 'package:chat_gate_ai/core/theme/app_colors.dart';
import 'package:chat_gate_ai/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract final class AppTheme {
  const AppTheme._();

  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.textLight,
      titleTextStyle: AppTextStyles.headline,
      iconTheme: const IconThemeData(color: AppColors.textLight),
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColors.backgroundLight,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppColors.navBar,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
      secondaryContainer: AppColors.navBar,
    ),
    textTheme: TextTheme(
      displayLarge: AppTextStyles.display.copyWith(fontSize: 38),
      displayMedium: AppTextStyles.display,
      displaySmall: AppTextStyles.display.copyWith(fontSize: 28),
      headlineLarge: AppTextStyles.headline,
      headlineMedium: AppTextStyles.headline,
      headlineSmall: AppTextStyles.headline,
      titleLarge: AppTextStyles.title,
      titleMedium: AppTextStyles.title,
      titleSmall: AppTextStyles.title,
      bodyLarge: AppTextStyles.body,
      bodyMedium: AppTextStyles.body,
      bodySmall: AppTextStyles.body,
      labelLarge: AppTextStyles.label,
      labelMedium: AppTextStyles.label,
      labelSmall: AppTextStyles.label,
    ),
  );

  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.textPrimary,
      titleTextStyle: AppTextStyles.headline,
      iconTheme: const IconThemeData(color: AppColors.textPrimary),
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColors.backgroundDark,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.navBarDark,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryDark,
      brightness: Brightness.dark,
      secondaryContainer: AppColors.navBarDark,
    ),
    textTheme: TextTheme(
      displayLarge: AppTextStyles.display.copyWith(fontSize: 38, color: AppColors.textLight),
      displayMedium: AppTextStyles.display.copyWith(color: AppColors.textLight),
      displaySmall: AppTextStyles.display.copyWith(fontSize: 28, color: AppColors.textLight),
      headlineLarge: AppTextStyles.headline.copyWith(color: AppColors.textLight),
      headlineMedium: AppTextStyles.headline.copyWith(color: AppColors.textLight),
      headlineSmall: AppTextStyles.headline.copyWith(color: AppColors.textLight),
      titleLarge: AppTextStyles.title.copyWith(color: AppColors.textLight),
      titleMedium: AppTextStyles.title.copyWith(color: AppColors.textLight),
      titleSmall: AppTextStyles.title.copyWith(color: AppColors.textLight),
      bodyLarge: AppTextStyles.body.copyWith(color: AppColors.textLight),
      bodyMedium: AppTextStyles.body.copyWith(color: AppColors.textLight),
      bodySmall: AppTextStyles.body.copyWith(color: AppColors.textLight),
      labelLarge: AppTextStyles.label.copyWith(color: AppColors.textLight),
      labelMedium: AppTextStyles.label.copyWith(color: AppColors.textLight),
      labelSmall: AppTextStyles.label.copyWith(color: AppColors.textLight),
    ),
  );
}
