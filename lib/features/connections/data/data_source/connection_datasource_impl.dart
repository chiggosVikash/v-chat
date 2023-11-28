import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:v_chat/features/connections/data/models/connection_model.dart';
import 'package:v_chat/features/login/data/models/user_model.dart';

import 'connection_datasource.dart';

class ConnectionDatasourceImpl implements ConnectionDatasource {
  final _firestore = FirebaseFirestore.instance;

  /// Creates a connection in the Firestore database.
  ///
  /// This method takes a [connection] object and an [email] as parameters.
  /// It creates a new document in the Firestore collection with the given [email].
  /// The document ID is set to the email of the [connection].
  /// The [connection] object is serialized to JSON and stored in the document.
  /// If the document already exists, the [connection] object is merged with the existing data.
  ///
  /// Returns `true` if the connection is successfully created, otherwise throws an error.
  @override
  Future<bool> createConnection(
      {required ConnectionModel connection, required String email}) async {
    try {
      final store = _firestore.collection(email);
      await store
          .doc(connection.email)
          .set(connection.toJson(), SetOptions(merge: true));
      return true;
    } catch (e) {
      rethrow;
    }
  }

  /// Deletes a connection from the Firestore database.
  ///
  /// Returns `true` if the connection is successfully deleted, otherwise throws an error.
  /// The [connectionId] parameter specifies the ID of the connection to be deleted.
  /// The [userEmail] parameter specifies the email of the user who owns the connection.
  @override
  Future<bool> deleteConnection(
      {required String connectionId, required String userEmail}) async {
    try {
      final store = _firestore.collection(userEmail);
      await store.doc(connectionId).delete();
      return true;
    } catch (e) {
      rethrow;
    }
  }

  /// Retrieves a list of connection models from the Firestore database.
  ///
  /// The [connectionId] parameter is the ID of the connection.
  /// The [userEmail] parameter is the email of the user.
  ///
  /// Returns a [Future] that completes with a list of [ConnectionModel] objects.
  /// Throws an error if the retrieval fails.
  @override
  Future<List<ConnectionModel>> getConnections(
      {required String connectionId, required String userEmail}) {
    try {
      final store = _firestore.collection(userEmail);
      return store.get().then((value) {
        final connections =
            value.docs.map((e) => ConnectionModel.fromJson(e.data())).toList();
        return connections;
      });
    } catch (e) {
      rethrow;
    }
  }

  /// Searches for a connection with the specified [connectionId].
  /// Returns a [UserModel] if the connection is found, otherwise returns null.
  /// Throws an exception if an error occurs during the search.
  @override
  Future<UserModel?> searchConnections({
    required String connectionId,
  }) async {
    try {
      final connectionData =
          await _firestore.collection("users").doc(connectionId).get();
      if (connectionData.exists) {
        final connection = UserModel.fromJson(connectionData.data()!);
        return connection;
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
