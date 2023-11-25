import 'package:v_chat/features/homepage/data/models/user_model.dart';

abstract class LoginRepo {
  Future<bool> loginWithPhone(UserModel user);
  Future<bool> loginWithGoogle(UserModel user);
  Future<bool> logOut();
}
