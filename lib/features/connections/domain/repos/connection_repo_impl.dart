import 'package:v_chat/features/connections/data/data_source/connection_datasource.dart';
import 'package:v_chat/features/connections/data/models/connection_model.dart';
import 'package:v_chat/features/connections/repos/connection_repo.dart';

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
}
