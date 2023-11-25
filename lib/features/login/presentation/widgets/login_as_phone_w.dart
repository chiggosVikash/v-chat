import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v_chat/features/login/presentation/providers/verify_phone_provider.dart';
import 'package:v_chat/features/login/presentation/widgets/otp_w.dart';
import 'package:v_chat/utils/extensions/context_extension.dart';

class LoginAsPhoneW extends ConsumerWidget {
  final TextEditingController _phoneController;
  final TextEditingController _nameController;
  final TextEditingController _surnameController;
  final TextEditingController _otpController;
  const LoginAsPhoneW(
      {super.key,
      required TextEditingController otpController,
      required TextEditingController phoneController,
      required TextEditingController nameController,
      required TextEditingController surnameController})
      : _phoneController = phoneController,
        _nameController = nameController,
        _otpController = otpController,
        _surnameController = surnameController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        /// field is used to enter the phone number.
        TextFormField(
          controller: _phoneController,
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            labelText: "Phone Number *",
            hintText: "Enter your phone number",
          ),
          keyboardType: TextInputType.phone,
        ),

        /// for spacing
        SizedBox(height: context.height * .02),

        /// field is used to enter the name.
        TextFormField(
          controller: _nameController,
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            labelText: "Name *",
            hintText: "Enter your name",
          ),
        ),

        /// for spacing
        SizedBox(height: context.height * .02),

        /// field is used to enter the surname.
        TextFormField(
          controller: _surnameController,
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            labelText: "Surname",
            hintText: "Enter your surname",
          ),
        ),

        /// for spacing
        SizedBox(height: context.height * .02),
        Consumer(
          builder: (context, ref, child) {
            final verifiedData = ref.watch(verifyPhoneNoProvider);
            if (verifiedData.value == null || verifiedData.value!.otp == null) {
              return const SizedBox();
            }
            return OtpW(otpController: _otpController);
          },
        )
      ],
    );
  }
}
