import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:secure_gates_admin/controllers/user_controller.dart';
import 'package:secure_gates_admin/general_providers.dart';
import 'package:secure_gates_admin/pages/guard_management/remove_guard.dart';
import '../auth_exception_handler.dart';
import '../entities/user.dart';

final userServiceProvider = Provider<UserServices>((ref) {
  return UserServices(ref);
});

abstract class BaseUserService {
  Future<List<User>> getUserList();
  Future<void> guradRemove(String guarduid);
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
        "${ref.read(generalUrlPathProvider)}/users_list.php",
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

  @override
  Future<void> guradRemove(String guarduid) async {
    EasyLoading.show();
    final userfName =
        ref.watch(userControllerProvider).currentUser!.userFirstName;
    final userlName =
        ref.watch(userControllerProvider).currentUser!.userLastName;
    try {
      final formData = FormData.fromMap(
          {"uid": guarduid, "removed_by": "$userfName $userlName"});

      final userResponse = await _dio.post(
        "${ref.read(generalUrlPathProvider)}/guard_removed_update.php",
        data: formData,
      );
      if (userResponse.data["status"] == 1) {
        EasyLoading.dismiss();
        // ignore: unused_result
        ref.refresh(allUserfListDataProvider.future);

        Fluttertoast.showToast(
            msg: "Guard Removed Successfully !!!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            backgroundColor: const Color(0xffFF6663),
            fontSize: 15.0);
      } else if (userResponse.data["status"] == 0) {
        EasyLoading.dismiss();
        Fluttertoast.showToast(
            msg: "Guard Removed Failed !!!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            fontSize: 15.0);
        return ErrorHandler.errorDialog(userResponse.data["status"]);
      }
    } catch (e) {
      EasyLoading.dismiss();
      throw ErrorHandler.errorDialog(e);
    }
  }
}
