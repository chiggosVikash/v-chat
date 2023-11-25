import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v_chat/utils/extensions/context_extension.dart';

class SendOtpButtonW extends ConsumerWidget {
  const SendOtpButtonW({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton.tonal(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(context.width * .4, context.height * .06),
        ),
        onPressed: () {},
        child: const Text("Send OTP"));
  }
}
