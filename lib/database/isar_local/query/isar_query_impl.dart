import 'package:isar/isar.dart';
import 'package:v_chat/database/db_query.dart';
import 'package:v_chat/features/login/data/models/user_model.dart';

import '../setup/isar_setup.dart';

class IsarQueryImpl implements DbQuery {
  final _isar = IsarSetup().isar;
  @override
  Future<bool> createUser(UserModel user) async {
    try {
      await _isar.writeTxn(() async {
        try {
          await _isar.userModels
              .filter()
              .emailEqualTo(user.email)
              .or()
              .phoneEqualTo(user.phone)
              .build()
              .deleteAll();
          await _isar.userModels.put(user);
        } catch (e) {
          rethrow;
        }
      });
      return Future.value(true);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> deleteUser({String? email, String? phone}) async {
    try {
      await _isar.writeTxn(() async {
        try {
          await _isar.userModels
              .filter()
              .emailEqualTo(email)
              .or()
              .phoneEqualTo(phone)
              .build()
              .deleteAll();
        } catch (e) {
          rethrow;
        }
      });
      return Future.value(true);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> isValidUser({String? email, String? phone}) async {
    try {
      final user = await _isar.userModels
          .filter()
          .emailEqualTo(email)
          .or()
          .phoneEqualTo(phone)
          .build()
          .findAll();
      if (user.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }
}
