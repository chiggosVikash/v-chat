import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:v_chat/features/connections/data/entities/connection_entity.dart';
part 'connection_model.g.dart';

@JsonSerializable()
@collection
class ConnectionModel extends ConnectionEntity {
  const ConnectionModel(
      {required super.name,
      required super.email,
      required super.connectedDate,
      super.connection,
      super.phone,
      super.photoUrl});

  factory ConnectionModel.fromJson(Map<String, dynamic> json) =>
      _$ConnectionModelFromJson(json);
  Map<String, dynamic> toJson() => _$ConnectionModelToJson(this);
}
