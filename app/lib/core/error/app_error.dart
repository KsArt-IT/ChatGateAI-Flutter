import 'package:chat_gate_ai/gen/app_localizations.dart';

sealed class AppError implements Exception {
  final String message;
  final int? statusCode;

  const AppError(this.message, [this.statusCode]);

  String localizedMessage(AppLocalizations locale) => message;

  @override
  String toString() => 'AppError: $message${statusCode != null ? ' (Status: $statusCode)' : ''}';
}

final class UnknownError extends AppError {
  UnknownError(String? message) : super(message = message ?? 'Unknown Error');

  @override
  String localizedMessage(AppLocalizations locale) => locale.unknownError;
}

final class SignInCancelledError extends AppError {
  SignInCancelledError(super.message);

  @override
  String localizedMessage(AppLocalizations locale) => locale.signInCancelledError;
}

final class NetworkError extends AppError {
  NetworkError(super.message);

  @override
  String localizedMessage(AppLocalizations locale) => locale.networkError;
}

final class SignInFailedError extends AppError {
  SignInFailedError(super.message);

  @override
  String localizedMessage(AppLocalizations locale) => locale.signInFailedError(message);
}
