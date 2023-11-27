import '../data/models/connection_model.dart';

abstract class ConnectionRepo {
  Future<List<ConnectionModel>> getConnections(
      {required String connectionId, required String userEmail});
  Future<bool> createConnection(
      {required ConnectionModel connection, required String email});
  Future<bool> deleteConnection(
      {required String connectionId, required String userEmail});
}
