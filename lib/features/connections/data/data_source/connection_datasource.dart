import 'package:v_chat/features/connections/data/models/connection_model.dart';
import 'package:v_chat/features/login/data/models/user_model.dart';

abstract class ConnectionDatasource {
  Future<List<ConnectionModel>> getConnections(
      {required String connectionId, required String userEmail});
  Future<bool> createConnection(
      {required ConnectionModel connection, required String email});
  Future<bool> deleteConnection(
      {required String connectionId, required String userEmail});

  Future<UserModel?> searchConnections({
    required String connectionId,
  });
}
