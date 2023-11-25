import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v_chat/features/login/presentation/providers/verify_phone_provider.dart';
import 'package:v_chat/utils/extensions/context_extension.dart';

class VerifyButtonW extends ConsumerWidget {
  final String _phone;
  const VerifyButtonW({super.key, required String phone}) : _phone = phone;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton.tonal(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(context.width * .4, context.height * .06),
        ),
        onPressed: () {
          ref.read(verifyPhoneNoProvider.notifier).verifyPhone(_phone);
        },
        child: const Text("Verify"));
  }
}
