import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v_chat/features/login/data/models/user_model.dart';

import '../../domain/use_cases/login_use_case.dart';

final loginProvider = AsyncNotifierProvider<LoginP, UserModel?>(() => LoginP());

class LoginP extends AsyncNotifier<UserModel?> {
  final _loginUsecase = LoginUsecase();
  @override
  FutureOr<UserModel?> build() {
    return null;
  }

  /// Logs in the user using Google authentication.
  ///
  /// This method sets the state to [AsyncLoading] to indicate that the login process is in progress.
  /// It then calls the [_loginUsecase.loginWithGoogle()] method to authenticate the user with Google.
  /// If the authentication is successful, it calls the [_loginUsecase.createUser()] method to create a user in the system.
  /// Finally, it sets the state to [AsyncData] with the logged-in user.
  ///
  /// If an error occurs during the login process, the state is set to [AsyncError] and the error is rethrown.
  Future<void> loginWithGoogle() async {
    state = const AsyncLoading();
    try {
      final user = await _loginUsecase.loginWithGoogle();
      final isUserExist = await _loginUsecase.isUserExist(email: user!.email);

      if (isUserExist == false) {
        await _loginUsecase.createUser(user);
      }
      state = AsyncData(user);
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
      if (kDebugMode) {
        rethrow;
      }
    }
  }
}
