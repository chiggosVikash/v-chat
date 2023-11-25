import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:v_chat/features/homepage/data/models/user_model.dart';

import 'login_data_source.dart';

class LoginDataSourceImpl implements LoginDataSource {
  final _firebaseAuth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();
  @override
  Future<bool> logOut() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel?> loginWithGoogle(UserModel userModel) async {
    try {
      final userAccount = await _googleSignIn.signIn();
      if (userAccount == null) return null;
      final googleAuth = await userAccount.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      final authResult = await _firebaseAuth.signInWithCredential(credential);
      final user = authResult.user;
      if (user == null) return null;
      return UserModel(
          name: user.displayName ?? '',
          email: user.email,
          photoUrl: user.photoURL,
          surname: '');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// Verifies the phone number by sending a verification code and returns the verification ID.
  ///
  /// This method uses the [_firebaseAuth] instance to verify the phone number. It handles the verification process by
  /// registering callbacks for different events such as verification completed, verification failed, and code sent.
  /// The verification ID is obtained from the [codeSent] callback and returned as a result.
  ///
  /// If an exception occurs during the verification process, it is rethrown.
  ///
  /// Throws an [Exception] if the user is not found during the verification process.
  ///

  @override
  Future<String> verifyPhone(String phone) async {
    try {
      String vId = '';
      await _firebaseAuth.verifyPhoneNumber(
        verificationCompleted: (credential) async {
          final status = await _firebaseAuth.signInWithCredential(credential);
          if (status.user == null) {
            throw Exception('LoginExecption: User not found');
          }
        },
        verificationFailed: (exeception) {
          throw Exception(exeception);
        },
        codeSent: (String verificationId, int? resendToken) {
          vId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      return vId;
    } catch (e) {
      rethrow;
    }
  }

  /// Logs in the user with a phone number using the provided verification ID and SMS code.
  ///
  /// Returns `true` if the login is successful, otherwise throws an exception.
  /// Throws an exception if the user is not found.
  ///
  /// Parameters:
  /// - [verificationId]: The verification ID received during the phone number verification process.
  /// - [smsCode]: The SMS code received during the phone number verification process.
  ///
  /// Throws:
  /// - [Exception]: If the user is not found during the login process.
  ///
  @override
  Future<bool> loginWithPhone(
      {required String verificationId, required String smsCode}) async {
    try {
      final credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);
      final status = await _firebaseAuth.signInWithCredential(credential);
      if (status.user == null) {
        throw Exception('LoginExecption: User not found');
      }
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
