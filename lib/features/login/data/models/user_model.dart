import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:v_chat/features/login/domain/entities/user_entity.dart';
part 'user_model.g.dart';

@JsonSerializable()
@collection
class UserModel extends UserEntity {
  const UserModel(
      {required super.name,
      super.email,
      super.photoUrl,
      super.surname,
      super.phone});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
