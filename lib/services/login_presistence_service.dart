import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../entities/user.dart';

abstract class BaseLoginPresistenceService {
  Future<void> setUserInPrefs(String userData);
  Future<User?> getUserFromPrefs();
}

final loginPresistenceServiceProvider =
    Provider<LoginPresistenceService>((ref) {
  return LoginPresistenceService();
});

class LoginPresistenceService implements BaseLoginPresistenceService {
  static const PREF_KEY_FOR_USER = "prefKeyForUser";
  static SharedPreferences? _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Future<User?> getUserFromPrefs() async {
    final userDataInJson =
        _sharedPreferences!.getString(PREF_KEY_FOR_USER) ?? "";

    if (userDataInJson.isEmpty) {
      return null;
    } else {
      final currentUser = User.fromJson(userDataInJson);
      return currentUser;
    }
  }

  @override
  Future<void> setUserInPrefs(String userData) async {
    _sharedPreferences!.setString(PREF_KEY_FOR_USER, userData);
  }
}
