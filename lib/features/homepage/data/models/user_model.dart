import 'package:json_annotation/json_annotation.dart';
import 'package:v_chat/features/homepage/domain/entities/user_entity.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends UserEntity {
  const UserModel(
      {required super.name, super.email, super.photoUrl, super.surname});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
