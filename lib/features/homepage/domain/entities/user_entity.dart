import 'package:flutter/foundation.dart';

@immutable
class UserEntity {
  final String name;
  final String? surname;
  final String? email;
  final String? photoUrl;

  const UserEntity({
    required this.name,
    this.surname,
    this.email,
    this.photoUrl,
  });
}
