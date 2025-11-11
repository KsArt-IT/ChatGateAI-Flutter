import 'package:chat_gate_ai/core/constants/app_dimens.dart';
import 'package:chat_gate_ai/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

abstract final class SnackBarManager {
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  static void showOf(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 5),
          showCloseIcon: true,
        ), //
      );
  }

  static void show(String message) {
    scaffoldMessengerKey.currentState
      ?..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(message), duration: const Duration(seconds: 3)),
      );
  }

  static void showError(String message) {
    scaffoldMessengerKey.currentState
      ?..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 3),
          backgroundColor: AppColors.error.withValues(alpha: AppDimens.alpha50),
        ),
      );
  }
}
