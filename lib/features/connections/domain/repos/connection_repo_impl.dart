import 'package:v_chat/features/connections/data/data_source/connection_datasource.dart';
import 'package:v_chat/features/connections/data/models/connection_model.dart';
import 'package:v_chat/features/connections/domain/repos/connection_repo.dart';
import 'package:v_chat/features/login/data/models/user_model.dart';

class ConnectionRepoImpl implements ConnectionRepo {
  final ConnectionDatasource _connectionDatasource;
  ConnectionRepoImpl(this._connectionDatasource);
  @override
  Future<bool> createConnection(
      {required ConnectionModel connection, required String email}) {
    return _connectionDatasource.createConnection(
        connection: connection, email: email);
  }

  @override
  Future<bool> deleteConnection(
      {required String connectionId, required String userEmail}) {
    return _connectionDatasource.deleteConnection(
        connectionId: connectionId, userEmail: userEmail);
  }

  @override
  Future<List<ConnectionModel>> getConnections(
      {required String connectionId, required String userEmail}) {
    return _connectionDatasource.getConnections(
        connectionId: connectionId, userEmail: userEmail);
  }

  @override
  Future<UserModel?> searchConnections({required String connectionId}) {
    return _connectionDatasource.searchConnections(connectionId: connectionId);
  }
}
