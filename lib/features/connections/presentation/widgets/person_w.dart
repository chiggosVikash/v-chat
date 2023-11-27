import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v_chat/utils/extensions/context_extension.dart';

class PersonW extends ConsumerWidget {
  const PersonW({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: const Text("Person Name here"),
      subtitle: const Text("Last Message here"),
      leading: CircleAvatar(
        radius: context.width * .09,
      ),
      trailing: const Text("last time"),
      onTap: () {},
    );
  }
}
