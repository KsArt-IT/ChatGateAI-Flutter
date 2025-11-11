import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'shared_preferences_provider.dart';

part 'app_settings_provider.g.dart';

// Модель настроек
class AppSettings {
  final ThemeMode theme;
  final Locale? locale;
  final bool isLocaleSystem;

  const AppSettings({
    this.theme = ThemeMode.system,
    this.locale,
    this.isLocaleSystem = true,
  });

  AppSettings copyWith({
    ThemeMode? theme,
    Locale? locale,
    bool? isLocaleSystem,
  }) => AppSettings(
    theme: theme ?? this.theme,
    locale: locale ?? this.locale,
    isLocaleSystem: isLocaleSystem ?? this.isLocaleSystem,
  );
}

@Riverpod(keepAlive: true)
class Settings extends _$Settings {
  static const String _themeKey = 'theme_mode';
  static const String _localeKey = 'locale';

  @override
  AppSettings build() {
    return const AppSettings();
  }

  Future<void> loadSettings() async {
    final prefs = await ref.read(sharedPreferencesProvider.future);

    final themeString = prefs.getString(_themeKey);
    final localeString = prefs.getString(_localeKey);
    final isLocaleSystem = localeString == null;

    state = AppSettings(
      theme: _parseThemeMode(themeString),
      locale: _parseLocale(localeString),
      isLocaleSystem: isLocaleSystem,
    );
  }

  Future<void> changeLocale(Locale? locale) async {
    final prefs = await ref.read(sharedPreferencesProvider.future);
    if (locale == null) {
      await prefs.remove(_localeKey);
    } else {
      await prefs.setString(_localeKey, locale.languageCode);
    }
    state = state.copyWith(
      locale: locale ?? WidgetsBinding.instance.platformDispatcher.locale,
      isLocaleSystem: locale == null,
    );
  }

  Locale? _parseLocale(String? value) => switch (value) {
    'en' => const Locale('en'),
    'ru' => const Locale('ru'),
    'uk' => const Locale('uk'),
    _ => null,
  };

  Future<void> changeTheme(bool? darkMode) => _setTheme(
    darkMode != null
        ? darkMode
              ? ThemeMode.dark
              : ThemeMode.light
        : ThemeMode.system,
  );

  Future<void> _setTheme(ThemeMode? theme) async {
    final prefs = await ref.read(sharedPreferencesProvider.future);
    if (theme == null) {
      await prefs.remove(_themeKey);
    } else {
      await prefs.setString(_themeKey, theme.name);
    }
    state = state.copyWith(theme: theme ?? ThemeMode.system);
  }

  ThemeMode _parseThemeMode(String? value) => switch (value) {
    'light' => ThemeMode.light,
    'dark' => ThemeMode.dark,
    _ => ThemeMode.system,
  };
}

// Удобные провайдеры для отдельных значений
@riverpod
ThemeMode theme(Ref ref) => ref.watch(settingsProvider).theme;

@riverpod
Locale? locale(Ref ref) => ref.watch(settingsProvider).locale;
