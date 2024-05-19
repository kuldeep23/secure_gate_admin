import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dio/dio.dart';
import '../auth_exception_handler.dart';
import '../controllers/user_controller.dart';
import 'login_presistence_service.dart';

final authServiceProvider = Provider<AuthenticationSerivce>((ref) {
  return AuthenticationSerivce(ref);
});

abstract class BaseAuthenticationService {
  Future<void> signInWithEmail(String mobileNo, String password);
  Future<void> signOut();
}

class AuthenticationSerivce implements BaseAuthenticationService {
  final Dio _dio = Dio();
  final Ref ref;

  AuthenticationSerivce(this.ref);

  @override
  Future<void> signInWithEmail(String mobileNo, String password) async {
    try {
      final formData =
          FormData.fromMap({"mobile_no": mobileNo, "password": password});

      final userResponse = await _dio.post(
        "https://gatesadmin.000webhostapp.com/admin_user.php",
        data: formData,
      );
      if (userResponse.data["code"] == "100") {
        final testData =
            Map<String, dynamic>.from(userResponse.data["data"] as dynamic);

        final passingData = jsonEncode(testData);

        await ref
            .read(loginPresistenceServiceProvider)
            .setUserInPrefs(passingData);

        await ref.read(userControllerProvider).configCurrentUser();
      } else if (userResponse.data["code"] == "101") {
        return ErrorHandler.errorDialog(userResponse.data["message"]);
      }
    } catch (e) {
      throw ErrorHandler.errorDialog(e);
    }
  }

  @override
  Future<void> signOut() async {
    await ref.watch(loginPresistenceServiceProvider).setUserInPrefs("");
    ref.watch(userControllerProvider).configCurrentUser();
  }
}
