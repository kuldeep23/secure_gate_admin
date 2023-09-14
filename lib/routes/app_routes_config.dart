import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:secure_gates_admin/pages/homepage/admin_home_page.dart';
import 'package:secure_gates_admin/pages/visitor_management/visitor_in.dart';
import 'package:secure_gates_admin/pages/visitor_management/visitor_out.dart';

import '../controllers/user_controller.dart';
import '../error/error_page.dart';
import '../pages/authentication/login_page.dart';
import '../pages/authentication/signup_page.dart';
import '../pages/homepage/home_page.dart';
import 'app_routes_constants.dart';

class MyAppRouterConfig {
  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();

  final bool isAuth;

  // static GoRouter returnRouter(bool isAuth) {
  //   GoRouter router = GoRouter(
  //       initialLocation: "/",
  //       routes: [ // using a factory is important
  // because it promises to return _an_ object of this type
  // but it doesn't promise to make a new one.
  ///return the instance of the
  MyAppRouterConfig(this.isAuth);
  // This named constructor is the "real" constructor
  // It'll be called exactly once, by the static property assignment above
  // it's also private, so it can only be called in this class

  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    navigatorKey: rootNavigatorKey,
    routes: [
      GoRoute(
        name: MyAppRoutes.splashScreen,
        path: "/",
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        name: MyAppRoutes.homePage,
        path: "/home-screen",
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        name: MyAppRoutes.adminPage,
        path: "/home-screen",
        builder: (context, state) => const AdminPage(),
      ),
      GoRoute(
        name: MyAppRoutes.loginPage,
        path: "/login-page",
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        name: MyAppRoutes.signupPage,
        path: "/signup-page",
        builder: (context, state) => const SignupPage(),
      ),
      GoRoute(
        name: MyAppRoutes.visitorInScreen,
        path: "/visitor-in-screen",
        builder: (context, state) => const VisitorIn(),
      ),
      GoRoute(
        name: MyAppRoutes.visitorOutScreen,
        path: "/visitor-out-screen",
        builder: (context, state) => const VisitorOut(),
      ),
    ],
    errorBuilder: (BuildContext context, GoRouterState state) =>
        const ErrorPage(),
    // redirect: (context, state) {
    //   if (!isAuth) {
    //     return "/login-page";
    //   } else {}
    //   return null;
    // },
  );
}

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginStatus = ref.watch(userControllerProvider).currentUser;

    useEffect(() {
      ref.watch(userControllerProvider).configCurrentUser();

      return null;
    }, []);

    if (loginStatus != null) {
      return const HomePage();
    } else {
      return const LoginPage();
    }
  }
}
