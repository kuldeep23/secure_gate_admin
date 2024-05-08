import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:secure_gates_admin/controllers/user_controller.dart';
import 'package:secure_gates_admin/entities/staff.dart';
import 'package:secure_gates_admin/pages/staff_management/staff_out.dart';
import '../auth_exception_handler.dart';
import '../pages/staff_management/staff_in.dart';

final staffServiceProvider = Provider<StaffServices>((ref) {
  return StaffServices(ref);
});

abstract class BaseStaffService {
  Future<List<Staff>> getOutsideStaff();
  Future<void> staffEnter(String staffId, String socCode);
  Future<List<Staff>> getInsideStaff();
  Future<void> staffExist(String staffuid, String staffsoccode);
  Future<List<Staff>> getAllStaff();

}

class StaffServices implements BaseStaffService {
  final Dio _dio = Dio();
  final Ref ref;

  StaffServices(this.ref);

  @override
  Future<List<Staff>> getOutsideStaff() async {
    try {
      final socCode = ref.watch(userControllerProvider).currentUser!.socCode;
      final formData = FormData.fromMap({"soc": socCode});

      final dataResponse = await _dio.post(
        "https://gatesadmin.000webhostapp.com/get_all_outside_staff.php",
        data: formData,
      );
      if (dataResponse.data["code"] == "100") {
        final results =
            List<Map<String, dynamic>>.from(dataResponse.data["data"]);

        List<Staff> staff = results
            .map((staffData) => Staff.fromMap(staffData))
            .toList(growable: false);

        return staff;
      } else {
        return [];
      }
    } catch (e) {
      throw ErrorHandler.errorDialog(e);
    }
  }

  @override
  Future<void> staffEnter(String staffId, String socCode) async {
    final guardName =
        ref.watch(userControllerProvider).currentUser!.ownerFirstName;
    try {
      final formData = FormData.fromMap(
          {"staff_id": staffId, "soc_code": socCode, "guard_name": guardName});

      final userResponse = await _dio.post(
        "https://gatesadmin.000webhostapp.com/staff_enter.php",
        data: formData,
      );
      if (userResponse.data["status"] == 1) {
        // ignore: unused_result
        ref.refresh(allOutsideStaffDataProvider.future);

        Fluttertoast.showToast(
            msg: "Staff Entered Successfully !!!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            backgroundColor: const Color(0xffFF6663),
            fontSize: 15.0);
      } else if (userResponse.data["status"] == 0) {
        Fluttertoast.showToast(
          msg: "Staff Entered Failed !!!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          textColor: Colors.white,
          backgroundColor: const Color(0xffFF6663),
          fontSize: 15.0,
          timeInSecForIosWeb: 1,
        );
        return ErrorHandler.errorDialog(userResponse.data["status"]);
      }
    } catch (e) {
      throw ErrorHandler.errorDialog(e);
    }
  }

  @override
  Future<List<Staff>> getInsideStaff() async {
    try {
      final socCode = ref.watch(userControllerProvider).currentUser!.socCode;
      final formData = FormData.fromMap({"soc": socCode});

      final dataResponse = await _dio.post(
        "https://gatesadmin.000webhostapp.com/get_all_inside_staff.php",
        data: formData,
      );
      if (dataResponse.data["code"] == "100") {
        final results =
            List<Map<String, dynamic>>.from(dataResponse.data["data"]);

        List<Staff> staff = results
            .map((staffData) => Staff.fromMap(staffData))
            .toList(growable: false);

        return staff;
      } else {
        return [];
      }
    } catch (e) {
      throw ErrorHandler.errorDialog(e);
    }
  }

  @override
  Future<void> staffExist(String staffuid, String staffsoccode) async {
    final guardName =
        ref.watch(userControllerProvider).currentUser!.ownerFirstName;
    try {
      final formData = FormData.fromMap({
        "staff_uid": staffuid,
        "staff_soc_code": staffsoccode,
        "guard_name": guardName
      });

      final userResponse = await _dio.post(
        "https://gatesadmin.000webhostapp.com/staff_exit.php",
        data: formData,
      );
      if (userResponse.data["status"] == 1) {
        // ignore: unused_result
        ref.refresh(allInsideStaffDataProvider.future);

        Fluttertoast.showToast(
            msg: "Staff Exist Successfully !!!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            backgroundColor: const Color(0xffFF6663),
            fontSize: 15.0);
      } else if (userResponse.data["status"] == 0) {
        Fluttertoast.showToast(
            msg: "Staff Exist Failed !!!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            fontSize: 15.0);
        return ErrorHandler.errorDialog(userResponse.data["status"]);
      }
    } catch (e) {
      throw ErrorHandler.errorDialog(e);
    }
  }

  @override
  Future<List<Staff>> getAllStaff() async {
    try {
      final socCode = ref.watch(userControllerProvider).currentUser!.socCode;
      final formData = FormData.fromMap({"soc": socCode});

      final dataResponse = await _dio.post(
        "https://gatesadmin.000webhostapp.com/staff_all_member_list.php",
        data: formData,
      );
      if (dataResponse.data["code"] == "100") {
        final results =
            List<Map<String, dynamic>>.from(dataResponse.data["data"]);

        List<Staff> staff = results
            .map((staffData) => Staff.fromMap(staffData))
            .toList(growable: false);

        return staff;
      } else {
        return [];
      }
    } catch (e) {
      throw ErrorHandler.errorDialog(e);
    }
  }
}
