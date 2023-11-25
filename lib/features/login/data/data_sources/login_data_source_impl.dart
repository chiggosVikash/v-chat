import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:v_chat/features/login/data/models/verification_model.dart';

import '../models/user_model.dart';
import 'login_data_source.dart';

///
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

  /// Asynchronously authenticates a user using Google Sign-In and Firebase Authentication.
  ///
  /// This method initiates the Google Sign-In process, retrieves the user's Google account
  /// information, and uses it to authenticate the user through Firebase Authentication.
  ///
  /// If the authentication is successful, a [UserModel] instance containing the user's
  /// information is returned. If the user cancels the Google Sign-In process or if any
  /// error occurs during authentication, the method returns `null`. In case of an error,
  /// an [Exception] is thrown with a descriptive error message.
  ///
  /// Returns:
  /// - A [Future] that completes with a [UserModel] if authentication is successful, or
  ///   `null` if the user cancels the Google Sign-In process or if any error occurs.
  ///
  /// Throws an [Exception] if any error occurs during the authentication process.
  @override
  Future<UserModel?> loginWithGoogle() async {
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
  Future<VerificationModel> verifyPhone(String phone) async {
    try {
      String vId = "";
      String? otp;
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (credential) {
          vId = credential.verificationId ?? "";
          otp = credential.smsCode;
        },
        verificationFailed: (exeception) {
          throw Exception(exeception);
        },
        codeSent: (String verificationId, int? resendToken) {
          vId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );

      /// returns verificationId and otp
      return VerificationModel(verificationId: vId, otp: otp);
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
