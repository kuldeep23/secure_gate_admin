import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:secure_gates_admin/controllers/user_controller.dart';
import 'package:secure_gates_admin/entities/society_user.dart';
import '../auth_exception_handler.dart';

final societyUserProvider = Provider<SocietyUserServices>((ref) {
  return SocietyUserServices(ref);
});

abstract class BaseSocietyUserService {
  Future<List<SocietyUser>> getActivateUser();
}

class SocietyUserServices implements BaseSocietyUserService {
  final Dio _dio = Dio();
  final Ref ref;

  SocietyUserServices(this.ref);

  @override
  Future<List<SocietyUser>> getActivateUser() async {
    try {
      final socCode = ref.watch(userControllerProvider).currentUser!.socCode;
      final formData = FormData.fromMap({"soc": socCode});

      final dataResponse = await _dio.post(
        "https://gatesadmin.000webhostapp.com/activate_user.php",
        data: formData,
      );
      if (dataResponse.data["code"] == "100") {
        final results =
            List<Map<String, dynamic>>.from(dataResponse.data["data"]);

        List<SocietyUser> societyUser = results
            .map((societyData) => SocietyUser.fromMap(societyData))
            .toList(growable: false);

        return societyUser;
      } else {
        return [];
      }
    } catch (e) {
      throw ErrorHandler.errorDialog(e);
    }
  }
}
