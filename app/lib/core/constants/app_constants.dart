/// Application-wide constants
abstract final class AppConstants {
  const AppConstants._();

  // App Info
  static const appName = 'ChatGateAI';
  static const appVersion = '1.0.0';

  // SharedPreferences Keys
  static const keyUserSettings = 'user_settings';
  static const keyIsFirstLaunch = 'is_first_launch';
  static const keyUserName = 'user_name';
  static const keyHasCompletedOnboarding = 'has_completed_onboarding';

  // UI Constants
  static const splashMinDuration = Duration(seconds: 1);
  static const animationDuration = Duration(milliseconds: 300);
}
