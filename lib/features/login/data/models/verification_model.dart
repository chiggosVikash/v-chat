import 'package:v_chat/features/login/domain/entities/verification_entity.dart';

class VerificationModel extends VerificationEntity {
  VerificationModel({required super.verificationId, required super.otp});

  VerificationModel copyWith({String? verificationId, String? otp}) {
    return VerificationModel(
        verificationId: verificationId ?? this.verificationId,
        otp: otp ?? this.otp);
  }
}
