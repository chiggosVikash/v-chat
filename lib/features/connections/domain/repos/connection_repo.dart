import 'package:v_chat/features/login/data/models/user_model.dart';

import '../../data/models/connection_model.dart';

abstract class ConnectionRepo {
  Future<List<ConnectionModel>> getConnections(
      {required String connectionId, required String userEmail});
  Future<bool> createConnection(
      {required ConnectionModel connection, required String email});
  Future<bool> deleteConnection(
      {required String connectionId, required String userEmail});

  Future<UserModel?> searchConnections({required String connectionId});
}
