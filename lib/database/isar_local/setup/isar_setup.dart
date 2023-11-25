import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:v_chat/features/login/data/models/user_model.dart';

class IsarSetup {
  static final _instance = IsarSetup._internal();

  IsarSetup._internal();
  factory IsarSetup() {
    return _instance;
  }

  late Isar isar;

  Future<void> setup() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      isar = await Isar.open([UserModelSchema], directory: dir.path);
    } catch (e) {
      rethrow;
    }
  }
}
