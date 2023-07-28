import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:secure_gates_admin/services/authentication_service.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Secure Gates Admin"),
      ),
      body: Center(
        child: GestureDetector(
          onLongPress: () async {
            await ref.watch(authServiceProvider).signOut();
          },
          child: const Text("hello "),
        ),
      ),
    );
  }
}
