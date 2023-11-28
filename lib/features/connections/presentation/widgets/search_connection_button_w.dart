import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchConnectionButtonW extends ConsumerWidget {
  const SearchConnectionButtonW({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton.tonalIcon(
        onPressed: () {},
        icon: const Icon(Icons.search),
        label: const Text("Search"));
  }
}
