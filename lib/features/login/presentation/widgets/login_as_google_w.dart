import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginAsGoogleW extends ConsumerWidget {
  const LoginAsGoogleW({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton.tonal(
        onPressed: () {}, child: const Text("Login with Google"));
  }
}
