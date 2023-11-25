import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v_chat/utils/extensions/context_extension.dart';

class LoginButton extends ConsumerWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton.tonal(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(context.width * .5, context.width * .12),
        ),
        onPressed: () {},
        child: const Text("Login"));
  }
}
