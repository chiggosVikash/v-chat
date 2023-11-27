import 'package:flutter/material.dart';
import 'package:v_chat/features/connections/presentation/widgets/add_new_connection_w.dart';
import 'package:v_chat/features/connections/presentation/widgets/person_w.dart';

class ConnectionScreen extends StatefulWidget {
  static const routeAddress = "/";
  const ConnectionScreen({super.key});

  @override
  State<ConnectionScreen> createState() => _ConnectionScreenState();
}

class _ConnectionScreenState extends State<ConnectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Connections"),
        actions: const [AddNewConnectionW()],
      ),
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return const PersonW();
          }),
    );
  }
}
