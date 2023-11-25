import 'package:v_chat/features/homepage/data/models/user_model.dart';

abstract class LoginDataSource {
  Future<String> verifyPhone(String phone);
  Future<bool> loginWithPhone(
      {required String verificationId, required String smsCode});
  Future<UserModel?> loginWithGoogle(UserModel userModel);
  Future<bool> logOut();
}
