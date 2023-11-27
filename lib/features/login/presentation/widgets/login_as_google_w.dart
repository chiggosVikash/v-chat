import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v_chat/features/connections/presentation/screens/connections_screen.dart';
import 'package:v_chat/features/login/presentation/providers/login_provider.dart';
import 'package:v_chat/utils/dialogues/error_dialogue.dart';
import 'package:v_chat/utils/dialogues/processing_dialogue.dart';
import 'package:v_chat/utils/dialogues/success_dialogue.dart';

class LoginAsGoogleW extends ConsumerWidget {
  const LoginAsGoogleW({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton.tonal(
        onPressed: () {
          _showLoginStatus(context, ref);
          ref.read(loginProvider.notifier).loginWithGoogle();
        },
        child: const Text("Login with Google"));
  }

  void _showLoginStatus(BuildContext context, WidgetRef ref) {
    showDialog(
        context: context,
        builder: (context) {
          return Consumer(builder: (context, ref, child) {
            final loginValue = ref.watch(loginProvider);

            return loginValue.when(
                data: (confirmData) {
                  Future(() {
                    Navigator.pushNamedAndRemoveUntil(context,
                        ConnectionScreen.routeAddress, (route) => false);
                  });
                  return const SuccessDialogue(
                      title: "Login",
                      content: "Login Successfull",
                      actions: []);
                },
                error: (e, st) => ErrorDialogue(error: e),
                loading: () => const ProcessingDialogue());
          });
        });
  }
}
