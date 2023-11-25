import 'package:flutter/material.dart';

class ProcessingDialogue extends StatelessWidget {
  const ProcessingDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Text(""),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RepaintBoundary(
            child: CircularProgressIndicator(),
          ),
          Text("Processing..."),
        ],
      ),
      actions: [],
    );
  }
}
