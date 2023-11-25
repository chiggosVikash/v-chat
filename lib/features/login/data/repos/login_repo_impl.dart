import 'package:v_chat/features/login/data/data_sources/login_data_source.dart';
import 'package:v_chat/features/login/data/models/user_model.dart';
import 'package:v_chat/features/login/data/models/verification_model.dart';
import 'package:v_chat/features/login/domain/repos/login_repo.dart';

class LoginRepoImpl extends LoginRepo {
  final LoginDataSource _loginDataSource;
  LoginRepoImpl(this._loginDataSource);
  @override
  Future<bool> logOut() {
    return _loginDataSource.logOut();
  }

  @override
  Future<UserModel?> loginWithGoogle() {
    return _loginDataSource.loginWithGoogle();
  }

  @override
  Future<bool> loginWithPhone(
      {required String verificationId, required String smsCode}) {
    return _loginDataSource.loginWithPhone(
        verificationId: verificationId, smsCode: smsCode);
  }

  @override
  Future<VerificationModel> verifyPhone(String phone) {
    return _loginDataSource.verifyPhone(phone);
  }
}
