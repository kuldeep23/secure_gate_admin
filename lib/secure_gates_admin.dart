import 'package:flutter/material.dart';
import 'package:secure_gates_admin/routes/app_routes_config.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: MyAppRouterConfig.router.routeInformationParser,
      routeInformationProvider:
          MyAppRouterConfig.router.routeInformationProvider,
      routerDelegate: MyAppRouterConfig.router.routerDelegate,
      debugShowCheckedModeBanner: false,
      title: 'Secure Gates Admin',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xffFF6663),
        ),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          color: Color(0xffFF6663),
        ),
        cardTheme: const CardTheme(surfaceTintColor: Colors.white),
        scaffoldBackgroundColor: Colors.grey[200],
        fontFamily: "Ubuntu",
        useMaterial3: true,
      ),
    );
  }
}
