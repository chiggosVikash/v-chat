import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v_chat/features/connections/presentation/widgets/connection_search_field_w.dart';
import 'package:v_chat/features/connections/presentation/widgets/search_connection_button_w.dart';
import 'package:v_chat/utils/extensions/context_extension.dart';

class AddConnectionScreen extends ConsumerStatefulWidget {
  static const routeAddress = "/addConnection";
  const AddConnectionScreen({super.key});

  @override
  ConsumerState<AddConnectionScreen> createState() =>
      _AddConnectionScreenState();
}

class _AddConnectionScreenState extends ConsumerState<AddConnectionScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Connection'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ConnectionSearchFieldW(emailController: _emailController),
                SizedBox(
                  height: context.height * .05,
                ),
                const SearchConnectionButtonW()
              ],
            ),
          ),
        ));
  }
}
