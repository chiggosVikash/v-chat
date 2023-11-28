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

  /// Logs in the user using Google authentication.
  ///
  /// Returns a [UserModel] object representing the logged-in user,
  /// or `null` if the login was unsuccessful.
  Future<UserModel?> loginWithGoogle() {
    return _loginRepo.loginWithGoogle();
  }

  /// Logs in with a phone number using the provided verification ID and SMS code.
  ///
  /// Returns a [Future] that completes with a [bool] value indicating whether the login was successful.
  /// The [verificationId] is the ID received during the phone number verification process.
  /// The [smsCode] is the code received via SMS for verification.
  Future<bool> loginWithPhone(
      {required String verificationId, required String smsCode}) {
    return _loginRepo.loginWithPhone(
        verificationId: verificationId, smsCode: smsCode);
  }

  /// Verifies the phone number.
  ///
  /// This method calls the [_loginRepo.verifyPhone] method to verify the given [phone] number.
  /// It returns a [Future] that resolves to a [VerificationModel] object.
  Future<VerificationModel> verifyPhone(String phone) {
    return _loginRepo.verifyPhone(phone);
  }

  /// Checks if a user exists based on their email or phone number.
  ///
  /// Returns a [Future] that completes with a [bool] value indicating whether the user exists or not.
  /// The [email] parameter is optional and represents the user's email address.
  /// The [phone] parameter is optional and represents the user's phone number.
  /// Throws an exception if an error occurs during the process.
  Future<bool> isUserExist({String? email, String? phone}) async {
    try {
      return await _cloudDb.isUserExist(email: email, phone: phone);
    } catch (e) {
      rethrow;
    }
  }

  /// Creates a user in the system.
  ///
  /// This method creates a user by calling the `createUser` method of the `_cloudDb` and `_localDb` instances.
  /// It takes a [UserModel] as a parameter and returns a [Future] that completes with a [bool] value indicating
  /// whether the user creation was successful or not.
  /// If an error occurs during the user creation process, it will be rethrown.
  Future<bool> createUser(UserModel user) async {
    try {
      await _cloudDb.createUser(user);
      await _localDb.createUser(user);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  /// Deletes a user from the cloud database and local database.
  ///
  /// Returns `true` if the user is successfully deleted, otherwise throws an error.
  /// The user can be identified by either their email or phone number.
  /// If both `email` and `phone` are provided, the user will be deleted based on both criteria.
  /// If only one of `email` or `phone` is provided, the user will be deleted based on that criteria.
  /// If both `email` and `phone` are `null`, an error will be thrown.
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
