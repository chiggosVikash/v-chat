import 'package:flutter/material.dart';

class ErrorDialogue extends StatelessWidget {
  final Object error;
  const ErrorDialogue({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Error"),
      content: Text("Error $error"),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel")),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Try again"))
      ],
    );
  }
}
