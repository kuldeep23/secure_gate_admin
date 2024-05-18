import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:secure_gates_admin/controllers/user_controller.dart';
import '../auth_exception_handler.dart';
import '../entities/user.dart';

final userServiceProvider = Provider<UserServices>((ref) {
  return UserServices(ref);
});

abstract class BaseUserService {
  Future<List<User>> getUserList();
}

class UserServices implements BaseUserService {
  final Dio _dio = Dio();
  final Ref ref;
  UserServices(this.ref);

  @override
  Future<List<User>> getUserList() async {
    try {
      final socCode = ref.watch(userControllerProvider).currentUser!.socCode;
      final formData = FormData.fromMap({"soc": socCode});

      final dataResponse = await _dio.post(
        "https://gatesadmin.000webhostapp.com/users_list.php",
        data: formData,
      );
      if (dataResponse.data["code"] == "100") {
        final results =
            List<Map<String, dynamic>>.from(dataResponse.data["data"]);

        List<User> user = results
            .map((userData) => User.fromMap(userData))
            .toList(growable: false);

        return user;
      } else {
        return [];
      }
    } catch (e) {
      throw ErrorHandler.errorDialog(e);
    }
  }

 
  
}
