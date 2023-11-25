import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v_chat/features/login/data/models/verification_model.dart';
import 'package:v_chat/features/login/domain/use_cases/login_use_case.dart';

final verifyPhoneNoProvider =
    AsyncNotifierProvider.autoDispose<VerifyPhoneP, VerificationModel>(
  () => VerifyPhoneP(),
);

class VerifyPhoneP extends AutoDisposeAsyncNotifier<VerificationModel> {
  final LoginUsecase _loginUsecase = LoginUsecase();

  @override
  FutureOr<VerificationModel> build() async {
    return VerificationModel(verificationId: "", otp: null);
  }

  Future<void> verifyPhone(String phone) async {
    state = const AsyncLoading();
    try {
      state = AsyncData(await _loginUsecase.verifyPhone(phone));
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
      if (kDebugMode) {
        rethrow;
      }
    }
  }
}
