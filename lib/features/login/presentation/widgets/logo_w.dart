import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v_chat/utils/extensions/context_extension.dart';

class LogoW extends ConsumerWidget {
  const LogoW({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CircleAvatar(radius: context.width * .2, child: const FlutterLogo());
  }
}
