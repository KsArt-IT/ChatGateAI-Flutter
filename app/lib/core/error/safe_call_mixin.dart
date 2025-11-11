import 'dart:developer';

import 'package:flutter/services.dart';

import 'app_error.dart';
import 'result.dart';

mixin SafeCallMixin {
  Future<Result<T?>> safeCall<T>(Future<T?> Function() invoke) async {
    try {
      final value = await invoke();
      return success(value);
    } on PlatformException catch (e) {
      log('PlatformException: ${e.toString()}', name: 'AppError');
      if (e.code == 'sign_in_canceled' || e.code == 'popup_closed_by_user') {
        return failure(SignInCancelledError('Login cancelled by user'));
      }
      return failure(UnknownError(e.message ?? 'Unknown Error'));
    } on AppError catch (e) {
      log('AppError: ${e.toString()}', name: 'AppError');
      return failure(e);
    } catch (e) {
      log('UnknownError: ${e.toString()}', name: 'AppError');
      return failure(UnknownError(e.toString()));
    }
  }
}
