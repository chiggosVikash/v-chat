import 'package:v_chat/database/db_query.dart';
import 'package:v_chat/database/firebase/firebase_query_impl.dart';
import 'package:v_chat/database/isar_local/query/isar_query_impl.dart';
import 'package:v_chat/features/login/data/data_sources/login_data_source_impl.dart';
import 'package:v_chat/features/login/data/models/verification_model.dart';
import 'package:v_chat/features/login/data/repos/login_repo_impl.dart';
import 'package:v_chat/features/login/domain/repos/login_repo.dart';

import '../../data/models/user_model.dart';

class LoginUsecase {
  final LoginRepo _loginRepo = LoginRepoImpl(LoginDataSourceImpl());
  final DbQuery _cloudDb = FirebaseQueryImpl();
  final DbQuery _localDb = IsarQueryImpl();

  Future<bool> logOut() {
    return _loginRepo.logOut();
  }

  Future<UserModel?> loginWithGoogle() {
    return _loginRepo.loginWithGoogle();
  }

  Future<bool> loginWithPhone(
      {required String verificationId, required String smsCode}) {
    return _loginRepo.loginWithPhone(
        verificationId: verificationId, smsCode: smsCode);
  }

  Future<VerificationModel> verifyPhone(String phone) {
    return _loginRepo.verifyPhone(phone);
  }

  Future<bool> createUser(UserModel user) async {
    try {
      await _cloudDb.createUser(user);
      await _localDb.createUser(user);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deleteUser({String? email, String? phone}) async {
    try {
      await _cloudDb.deleteUser(email: email, phone: phone);
      await _localDb.deleteUser(email: email, phone: phone);
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
