import '../../features/homepage/data/models/user_model.dart';

abstract class FirebaseQuery {
  Future<bool> createUser(UserModel user);
  Future<bool> isValidUser({String? email, String? phone});
  Future<bool> deleteUser({String? email, String? phone});
  Future<bool> updateUser(UserModel user);
}
