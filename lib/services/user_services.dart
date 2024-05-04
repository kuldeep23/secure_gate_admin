import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:secure_gates_admin/controllers/user_controller.dart';
import 'package:secure_gates_admin/entities/society_user.dart';
import 'package:secure_gates_admin/pages/user_management/deactivate_user.dart';
import '../auth_exception_handler.dart';

final societyUserProvider = Provider<SocietyUserServices>((ref) {
  return SocietyUserServices(ref);
});

abstract class BaseSocietyUserService {
  Future<List<SocietyUser>> getActivateUser();
  Future<List<SocietyUser>> getdeActivateUser();
  Future<void> deactivateUserUpdate(String reviewid);
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

  @override
  Future<List<SocietyUser>> getdeActivateUser() async {
    try {
      final socCode = ref.watch(userControllerProvider).currentUser!.socCode;
      final formData = FormData.fromMap({"soc": socCode});

      final dataResponse = await _dio.post(
        "https://gatesadmin.000webhostapp.com/deactivate_user.php",
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

  @override
  Future<void> deactivateUserUpdate(String uid) async {
    try {
      final formData = FormData.fromMap({"UID": uid});

      final userResponse = await _dio.post(
        "https://gatesadmin.000webhostapp.com/deactivate_user_update.php",
        data: formData,
      );
      if (userResponse.data["status"] == 1) {

        ref.refresh(allSocietyUserDataProvider.future);
        
        //print(value1);
        Fluttertoast.showToast(
            msg: "Deactivate User successfully !!!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            textColor: Colors.black,
            fontSize: 30.0);
      } else if (userResponse.data["status"] == 0) {
        Fluttertoast.showToast(
            msg: "Deactivate User successfully Failed",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            backgroundColor: Colors.red,
            fontSize: 30.0);
        return ErrorHandler.errorDialog(userResponse.data["status"]);
      }
    } catch (e) {
      throw ErrorHandler.errorDialog(e);
    }
  }
}
