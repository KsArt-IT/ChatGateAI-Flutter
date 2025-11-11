import 'package:chat_gate_ai/core/constants/app_dimens.dart';
import 'package:chat_gate_ai/core/extensions/context_extensions.dart';
import 'package:chat_gate_ai/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppErrorScreen extends StatelessWidget {
  final String error;

  const AppErrorScreen({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppDimens.inset4x),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: 80,
                color: AppColors.error,
              ),
              const SizedBox(height: AppDimens.inset4x),
              Text(
                context.l10n.appInitError,
              ),
              const SizedBox(height: AppDimens.inset4x),
              Text(
                error,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
