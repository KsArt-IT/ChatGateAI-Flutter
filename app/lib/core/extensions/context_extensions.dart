import 'package:chat_gate_ai/gen/app_localizations.dart';
import 'package:flutter/material.dart';

/// Extensions for BuildContext
extension ContextExtensions on BuildContext {
  /// Get app localizations
  AppLocalizations get l10n => AppLocalizations.of(this);
  AppLocalizations get locale => AppLocalizations.of(this);

  /// Get theme data
  ThemeData get theme => Theme.of(this);

  /// Get color scheme
  ColorScheme get colorScheme => theme.colorScheme;

  /// Get text theme
  TextTheme get textTheme => theme.textTheme;

  /// Get media query
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Get screen size
  Size get screenSize => mediaQuery.size;

  /// Get screen width
  double get screenWidth => screenSize.width;

  /// Get screen height
  double get screenHeight => screenSize.height;
}
