import 'package:flutter/material.dart';
import 'package:v_chat/features/connections/presentation/screens/add_connection.dart';

class AddNewConnectionW extends StatelessWidget {
  const AddNewConnectionW({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pushNamed(context, AddConnectionScreen.routeAddress);
        },
        icon: const Icon(Icons.add_box));
  }
}
