import 'package:chat_gate_ai/core/extensions/context_extensions.dart';
import 'package:chat_gate_ai/core/manager/snack_bar_manager.dart';
import 'package:chat_gate_ai/core/providers/app_settings_provider.dart';
import 'package:chat_gate_ai/core/router/app_router_provider.dart';
import 'package:chat_gate_ai/core/theme/app_theme.dart';
import 'package:chat_gate_ai/core/utils/system_ui_manager.dart';
import 'package:chat_gate_ai/gen/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    final settings = ref.watch(settingsProvider);

    // Обновляем системную область при изменении настроек
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemUiManager.updateSystemUi(
        settings.theme,
        MediaQuery.platformBrightnessOf(context),
      );
    });
    return MaterialApp.router(
      onGenerateTitle: (context) => context.l10n.appTitle,
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: SnackBarManager.scaffoldMessengerKey,
      // Theme
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: settings.theme,
      // Locale
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: settings.locale,
      // Navigation
      routerConfig: router,
    );
  }
}
