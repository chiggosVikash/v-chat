import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Homepage extends ConsumerStatefulWidget {
  static const routeAddress = "/homepage";
  const Homepage({
    super.key,
  });

  @override
  ConsumerState<Homepage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homepage"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Homepage',
            ),
          ],
        ),
      ),
    );
  }
}
