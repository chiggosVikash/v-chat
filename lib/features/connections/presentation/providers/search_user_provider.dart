import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v_chat/features/connections/domain/usecases/connection_usecase.dart';

import '../../../login/data/models/user_model.dart';

final searchUserProvider =
    AsyncNotifierProvider.autoDispose<SearchUserP, UserModel?>(
        () => SearchUserP());

class SearchUserP extends AutoDisposeAsyncNotifier<UserModel?> {
  final ConnectionUsecase _connectionUsecase = ConnectionUsecase();
  @override
  FutureOr<UserModel?> build() {
    return null;
  }

  Future<void> searchUser({required String connectionId}) async {
    state = const AsyncLoading();
    try {
      final user = await _connectionUsecase.searchConnections(
        connectionId: connectionId,
      );
      state = AsyncData(user);
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
    }
  }
}
