import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:secure_gates_admin/secure_gates_admin.dart';
import 'package:secure_gates_admin/services/login_presistence_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LoginPresistenceService.init();
  runApp(const ProviderScope(child: MyApp()));
}
