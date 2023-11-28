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

  /// Verifies the given phone number.
  ///
  /// This method sets the state to [AsyncLoading] before making the verification request.
  /// If the verification is successful, the state is set to [AsyncData] with the result.
  /// If an error occurs during the verification process, the state is set to [AsyncError]
  /// with the error and stack trace. If the app is running in debug mode, the error is rethrown.
  ///
  /// Parameters:
  /// - [phone]: The phone number to verify.
  ///
  /// Returns: A [Future] that completes when the verification process is finished.
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
