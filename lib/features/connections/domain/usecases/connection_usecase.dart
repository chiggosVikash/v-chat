import 'package:v_chat/features/connections/data/data_source/connection_datasource_impl.dart';
import 'package:v_chat/features/connections/data/models/connection_model.dart';
import 'package:v_chat/features/connections/domain/repos/connection_repo.dart';
import 'package:v_chat/features/connections/domain/repos/connection_repo_impl.dart';
import 'package:v_chat/features/login/data/models/user_model.dart';

class ConnectionUsecase {
  final ConnectionRepo _connectionRepo =
      ConnectionRepoImpl(ConnectionDatasourceImpl());

  Future<List<ConnectionModel>> getConnections(
      {required String connectionId, required String userEmail}) async {
    return await _connectionRepo.getConnections(
        connectionId: connectionId, userEmail: userEmail);
  }

  Future<bool> createConnection(
      {required ConnectionModel connection, required String email}) async {
    return await _connectionRepo.createConnection(
        connection: connection, email: email);
  }

  Future<bool> deleteConnection(
      {required String connectionId, required String userEmail}) async {
    return await _connectionRepo.deleteConnection(
        connectionId: connectionId, userEmail: userEmail);
  }

  Future<UserModel?> searchConnections({
    required String connectionId,
  }) async {
    return await _connectionRepo.searchConnections(
      connectionId: connectionId,
    );
  }
}
