import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginAsPhoneW extends ConsumerWidget {
  final TextEditingController _phoneController;
  const LoginAsPhoneW(
      {super.key, required TextEditingController phoneController})
      : _phoneController = phoneController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      controller: _phoneController,
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: "Phone Number *",
        hintText: "Enter your phone number",
      ),
      keyboardType: TextInputType.phone,
    );
  }
}
