import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

@immutable
class ConnectionEntity {
  @JsonKey(includeFromJson: false, includeToJson: false)
  final Id id = Isar.autoIncrement;
  final String name;
  final String email;
  final String? phone;
  final String? photoUrl;
  final String? connection;
  final String connectedDate;
  const ConnectionEntity({
    required this.connectedDate,
    required this.name,
    required this.email,
    this.phone,
    this.photoUrl,
    this.connection,
  });
}
