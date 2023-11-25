import 'dart:async';

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

  Future<void> loginWithGoogle() async {
    state = const AsyncLoading();
    try {
      state = AsyncData(await _loginUsecase.loginWithGoogle());
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
      rethrow;
    }
  }
}
