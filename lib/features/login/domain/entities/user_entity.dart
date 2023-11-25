import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

@immutable
class UserEntity {
  @JsonKey(includeFromJson: false, includeToJson: false)
  final Id id = Isar.autoIncrement;
  final String name;
  final String? surname;
  final String? email;
  final String? photoUrl;
  final String? phone;

  const UserEntity({
    required this.name,
    this.surname,
    this.phone,
    this.email,
    this.photoUrl,
  });
}
