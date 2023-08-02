import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:secure_gates_admin/services/authentication_service.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState(0);

    return Scaffold(
      appBar: AppBar(
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
      bottomNavigationBar: NavigationBar(
        height: 60,
        onDestinationSelected: (value) {
          selectedIndex.value = value;
        },
        selectedIndex: selectedIndex.value,
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(
              Icons.home,
            ),
            icon: Icon(
              Icons.home_outlined,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.person,
            ),
            icon: Icon(
              Icons.person_outline,
            ),
            label: 'Activities',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.emergency,
            ),
            icon: Icon(
              Icons.emergency_outlined,
            ),
            label: 'Emergency',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.settings,
            ),
            icon: Icon(
              Icons.settings_outlined,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
