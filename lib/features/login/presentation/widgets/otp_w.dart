import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtpW extends ConsumerWidget {
  final TextEditingController _otpController;
  const OtpW({super.key, required TextEditingController otpController})
      : _otpController = otpController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      controller: _otpController,
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: "OTP *",
        hintText: "Enter your OTP",
      ),
      keyboardType: TextInputType.phone,
    );
  }
}
