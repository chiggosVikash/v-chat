import 'package:v_chat/database/db_query.dart';
import 'package:v_chat/features/login/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseQueryImpl implements DbQuery {
  final _firestore = FirebaseFirestore.instance;
  @override
  Future<bool> createUser(UserModel user) async {
    try {
      if (user.email == null && user.phone == null) {
        throw Exception('Email or Phone is required');
      }
      final store = _firestore.collection('users');
      await store
          .doc(user.email ?? user.phone)
          .set(user.toJson(), SetOptions(merge: true));
      return true;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> deleteUser({String? email, String? phone}) async {
    try {
      if (email == null && phone == null) {
        throw Exception('Email or Phone is required');
      }
      final store = _firestore.collection('users');
      await store.doc(email ?? phone).delete();
      return true;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> isValidUser({String? email, String? phone}) async {
    try {
      if (email == null && phone == null) {
        throw Exception('Email or Phone is required');
      }
      final store = _firestore.collection('users');
      final user = await store.doc(email ?? phone).get();
      return user.exists;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> isUserExist({String? email, String? phone}) {
    try {
      return isValidUser(email: email, phone: phone);
    } catch (e) {
      rethrow;
    }
  }
}
