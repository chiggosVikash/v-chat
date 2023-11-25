import 'package:flutter/material.dart';

class SuccessDialogue extends StatelessWidget {
  final String _title;
  final String _content;
  final List<Widget> _actions;
  const SuccessDialogue(
      {super.key,
      required String title,
      required String content,
      required List<Widget> actions})
      : _actions = actions,
        _title = title,
        _content = content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(_title),
      content: Text(_content),
      actions: _actions,
    );
  }
}
