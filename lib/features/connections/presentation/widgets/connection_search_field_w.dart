import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConnectionSearchFieldW extends ConsumerWidget {
  final TextEditingController _emailController;
  const ConnectionSearchFieldW(
      {super.key, required TextEditingController emailController})
      : _emailController = emailController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      controller: _emailController,
      decoration: const InputDecoration(
        labelText: 'Email',
      ),
    );
  }
}
