import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:secure_gates_admin/controllers/user_controller.dart';
import 'package:secure_gates_admin/entities/visitor.dart';
import '../auth_exception_handler.dart';


final visitorServiceProvider = Provider<VisitorService>((ref) {
  return VisitorService(ref);
});

abstract class BaseVisitorService {
  Future<List<Visitor>> getInsideVisitors();
  Future<List<Visitor>> getWrongVisitors();
  Future<void> visitorreview(String reviewid, String review);
  Future<void> visitorout(String visitorid);
}

class VisitorService implements BaseVisitorService {
  final Dio _dio = Dio();
  final Ref ref;

  VisitorService(this.ref);

  @override
  Future<List<Visitor>> getInsideVisitors() async {
    try {
      final socCode = ref.watch(userControllerProvider).currentUser!.socCode;
      final formData = FormData.fromMap({"soc_code": socCode});

      final dataResponse = await _dio.post(
        "https://gatesadmin.000webhostapp.com/all_visitors_list.php",
        data: formData,
      );

      final results = List<Map<String, dynamic>>.from(dataResponse.data);

      List<Visitor> visitors = results
          .map((visitorData) => Visitor.fromMap(visitorData))
          .toList(growable: false);

      return visitors;
    } catch (e) {
      throw ErrorHandler.errorDialog(e);
    }
  }

   @override
  Future<List<Visitor>> getWrongVisitors() async {
    try {
      final socCode = ref.watch(userControllerProvider).currentUser!.socCode;
          final formData = FormData.fromMap({
        'soc': socCode,
      });

      final dataResponse = await _dio.post(
        "https://gatesadmin.000webhostapp.com/get_wrong_visitors.php",
        data: formData,
      );

      final results = List<Map<String, dynamic>>.from(dataResponse.data);

      List<Visitor> wrongvisitors = results
          .map((visitorData) => Visitor.fromMap(visitorData))
          .toList(growable: false);

      return wrongvisitors;
    } catch (e) {
      throw ErrorHandler.errorDialog(e);
    }
  }

   @override
  Future<void> visitorreview(String reviewid, String review) async {
    try {
      final formData =
          FormData.fromMap({"visitor_id": reviewid, "visitor_review": review});

      final userResponse = await _dio.post(
        "https://gatesadmin.000webhostapp.com/visitor_review.php",
        data: formData,
      );
      if (userResponse.data["status"] == 1) {
        
        //print("Done");
        Fluttertoast.showToast(
        msg: "Feedback sent successfully !!!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.black,
        fontSize: 30.0
    );
      } else if (userResponse.data["status"] == 0) {
         Fluttertoast.showToast(
        msg: "Feedback sent faied !!!",
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

  @override
  Future<void> visitorout(String visitorid) async {
    try {
      final formData =
          FormData.fromMap({"visitor_id": visitorid});

      final userResponse = await _dio.post(
        "https://gatesadmin.000webhostapp.com/visitor_out.php",
        data: formData,
      );
      if (userResponse.data["status"] == 1) {
        
         Fluttertoast.showToast(
        msg: "Visitor out successfully !!!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        backgroundColor: Colors.red,
        fontSize: 30.0
    );
      } else if (userResponse.data["status"] == 0) {
         Fluttertoast.showToast(
        msg: "Visitor out Falied !!!",
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
