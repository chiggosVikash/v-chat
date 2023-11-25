import 'package:v_chat/features/login/data/models/verification_model.dart';

import '../../data/models/user_model.dart';

abstract class LoginRepo {
  Future<VerificationModel> verifyPhone(String phone);
  Future<bool> loginWithPhone(
      {required String verificationId, required String smsCode});
  Future<UserModel?> loginWithGoogle();
  Future<bool> logOut();
}
