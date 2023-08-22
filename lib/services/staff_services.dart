import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:secure_gates_admin/controllers/user_controller.dart';
import 'package:secure_gates_admin/entities/staff.dart';
import '../auth_exception_handler.dart';


final staffServiceProvider = Provider<StaffServices>((ref) {
  return StaffServices(ref);
});

abstract class BaseStaffService {
  Future<List<Staff>> getStaff();
  Future<void> staffEnter(String staffId, String socCode);
}

class StaffServices implements BaseStaffService {
  final Dio _dio = Dio();
  final Ref ref;

  StaffServices(this.ref);

  @override
  Future<List<Staff>> getStaff() async {
    try {
      final socCode = ref.watch(userControllerProvider).currentUser!.socCode;
      final formData = FormData.fromMap({"soc": socCode});

      final dataResponse = await _dio.post(
        "https://gatesadmin.000webhostapp.com/get_all_staff.php",
        data: formData,
      );

      final results = List<Map<String, dynamic>>.from(dataResponse.data["data"]);
      
      List<Staff> staff = results
          .map((staffData) => Staff.fromMap(staffData))
          .toList(growable: false);

      return staff;
    } catch (e) {
      throw ErrorHandler.errorDialog(e);
    }
  }

  @override
  Future<void> staffEnter(String staffId, String socCode) async {
    try {
       
       final formData =
          FormData.fromMap({"staff_id": staffId, "soc_code": socCode});

      final userResponse = await _dio.post(
        "https://gatesadmin.000webhostapp.com/staff_enter.php",
        data: formData,
      );
      if (userResponse.data["status"] == 1) {
        
        //print(value1);
        Fluttertoast.showToast(
        msg: "Staff Entered Successfully !!!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.black,
        fontSize: 30.0
    );
      } else if (userResponse.data["status"] == 0) {
         Fluttertoast.showToast(
        msg: "Staff Entered Failed !!!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        backgroundColor: Colors.red,
        fontSize: 30.0
    );
        return ErrorHandler.errorDialog(userResponse.data["status"]);
      }
    } catch (e) {
      throw ErrorHandler.errorDialog(e);
    }
  }


  }
