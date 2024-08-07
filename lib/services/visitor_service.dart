import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:secure_gates_admin/controllers/user_controller.dart';
import 'package:secure_gates_admin/entities/visitor.dart';
import 'package:secure_gates_admin/general_providers.dart';
import 'package:secure_gates_admin/pages/visitor_management/wrong_visitor.dart';
import '../auth_exception_handler.dart';
import '../entities/wrongvisitor.dart';
import '../pages/visitor_management/visitor_out.dart';

final visitorServiceProvider = Provider<VisitorService>((ref) {
  return VisitorService(ref);
});

abstract class BaseVisitorService {
  Future<List<Visitor>> getInsideVisitors();
  Future<void> visitorEntry(
    String visitorType,
    String visitorName,
    String visitorMobile,
    String visitorFlatNo,
    String visitorImage,
  );
  Future<List<Wrongvisitor>> getWrongVisitors();
  Future<void> visitorreview(String reviewid, String review);
  Future<void> visitorout(String visitorid, String visitorOutByName);
  Future<void> updatevisitorFlat(
    String socCode,
    String visitorType,
    String visitorTypeDetails,
    String visitorName,
    String visitorMobile,
    String visitorFlatNo,
    String visitorImage,
    String visitorEnterDate,
    String visitorEnterTime,
    String visitorExistDate,
    String visitorExistTime,
    String visitorApproveBy,
    String visitorStatus,
    String visitorReview,
    String visitorid,
  );
}

class VisitorService implements BaseVisitorService {
  final Dio _dio = Dio();
  final Ref ref;

  VisitorService(this.ref);

  Visitor? _visitors;
  Visitor? get visitors => _visitors;

  @override
  Future<void> visitorEntry(String visitorType, String visitorName,
      String visitorMobile, String visitorFlatNo, String visitorImage) async {
    try {
      final formData = FormData.fromMap({
        "Visitor_Type": visitorType,
        "Visitor_Name": visitorName,
        "Visitor_Mobile": visitorMobile,
        "Visitor_Flat_No": visitorFlatNo,
        "Visitor_Image": visitorImage
      });

      final userResponse = await _dio.post(
        "${ref.read(generalUrlPathProvider)}/jh_visitors.php",
        data: formData,
      );
      if (userResponse.data["status"] == 1) {
        //print(value1);
        Fluttertoast.showToast(
            msg: "Visitor Enter successfully !!!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            textColor: Colors.black,
            fontSize: 30.0);
      } else if (userResponse.data["status"] == 0) {
        Fluttertoast.showToast(
            msg: "Visitor Enter faied !!!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            backgroundColor: Colors.red,
            fontSize: 30.0);
        return ErrorHandler.errorDialog(userResponse.data["status"]);
      }
    } catch (e) {
      throw ErrorHandler.errorDialog(e.toString());
    }
  }

  @override
  Future<List<Visitor>> getInsideVisitors() async {
    try {
      final socCode = ref.watch(userControllerProvider).currentUser!.socCode;
      final formData = FormData.fromMap({"soc_code": socCode});

      final dataResponse = await _dio.post(
        "${ref.read(generalUrlPathProvider)}/all_visitors_list.php",
        data: formData,
      );
      if (dataResponse.data["code"] == "100") {
        final results =
            List<Map<String, dynamic>>.from(dataResponse.data["data"]);

        List<Visitor> visitors = results
            .map((visitorData) => Visitor.fromMap(visitorData))
            .toList(growable: false);

        return visitors;
      } else {
        return [];
      }
    } catch (e) {
      log(e.toString());
      throw ErrorHandler.errorDialog(e.toString());
    }
  }

  @override
  Future<List<Wrongvisitor>> getWrongVisitors() async {
    try {
      final socCode = ref.watch(userControllerProvider).currentUser!.socCode;
      final formData = FormData.fromMap({
        'soc': socCode,
      });

      final dataResponse = await _dio.post(
        "${ref.read(generalUrlPathProvider)}/get_wrong_visitors.php",
        data: formData,
      );

      if (dataResponse.data["code"] == "100") {
        final results =
            List<Map<String, dynamic>>.from(dataResponse.data["data"]);

        List<Wrongvisitor> wrongvisitors = results
            .map((visitorData) => Wrongvisitor.fromMap(visitorData))
            .toList(growable: false);

        return wrongvisitors;
      } else {
        return [];
      }
    } catch (e) {
      throw ErrorHandler.errorDialog(e.toString());
    }
  }

  @override
  Future<void> visitorreview(String reviewid, String review) async {
    EasyLoading.show();
    try {
      final formData =
          FormData.fromMap({"visitor_id": reviewid, "visitor_review": review});

      final userResponse = await _dio.post(
        "${ref.read(generalUrlPathProvider)}/visitor_review.php",
        data: formData,
      );
      if (userResponse.data["status"] == 1) {
        EasyLoading.dismiss();
        //print(value1);
        Fluttertoast.showToast(
            msg: "Feedback sent successfully !!!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            backgroundColor: Colors.red,
            fontSize: 15.0);
      } else if (userResponse.data["status"] == 0) {
        EasyLoading.dismiss();
        Fluttertoast.showToast(
            msg: "Feedback sent faied !!!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            backgroundColor: Colors.red,
            fontSize: 15.0);
        return ErrorHandler.errorDialog(userResponse.data["status"]);
      }
    } catch (e) {
      EasyLoading.dismiss();
      throw ErrorHandler.errorDialog(e.toString());
    }
  }

  @override
  Future<void> visitorout(String visitorid, String visitorOutByName) async {
    EasyLoading.show();
    try {
      final formData = FormData.fromMap(
          {"visitor_id": visitorid, "exit_by": visitorOutByName});

      final userResponse = await _dio.post(
        "${ref.read(generalUrlPathProvider)}/visitor_out.php",
        data: formData,
      );
      if (userResponse.data["status"] == 1) {
        EasyLoading.dismiss();
        // ignore: unused_result
        ref.refresh(insideVisitorDataProvider.future);

        Fluttertoast.showToast(
            msg: "Visitor exist successfully !!!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            backgroundColor: Colors.red,
            fontSize: 15.0);
      } else if (userResponse.data["status"] == 0) {
        EasyLoading.dismiss();
        Fluttertoast.showToast(
            msg: "Visitor out Falied !!!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            backgroundColor: Colors.red,
            fontSize: 30.0);
        return ErrorHandler.errorDialog(userResponse.data["status"]);
      }
    } catch (e) {
      EasyLoading.dismiss();
      throw ErrorHandler.errorDialog(e.toString());
    }
  }

  @override
  Future<void> updatevisitorFlat(
      String socCode,
      String visitorType,
      String visitorTypeDetails,
      String visitorName,
      String visitorMobile,
      String visitorFlatNo,
      String visitorImage,
      String visitorEnterDate,
      String visitorEnterTime,
      String visitorExistDate,
      String visitorExistTime,
      String visitorApproveBy,
      String visitorStatus,
      String visitorReview,
      String visitorid) async {
    try {
      final formData = FormData.fromMap({
        "soc_code": socCode,
        "visitor_type": visitorType,
        "visitor_type_details": visitorTypeDetails,
        "visitor_name": visitorName,
        "visitor_mobile": visitorMobile,
        "visitor_flat_no": visitorFlatNo,
        "visitor_image": visitorImage,
        "visitor_enter_date": visitorEnterDate,
        "visitor_enter_time": visitorEnterTime,
        "visitor_exist_date": visitorExistDate,
        "visitor_exist_time": visitorExistTime,
        "visitor_approve_by": visitorApproveBy,
        "visitor_status": visitorStatus,
        "visitor_review": visitorReview,
        "visitor_id": visitorid
      });

      final userResponse = await _dio.post(
        "${ref.read(generalUrlPathProvider)}/wrong_visitor_update.php",
        data: formData,
      );
      if (userResponse.data["status"] == 1) {
        // ignore: unused_result
        ref.refresh(wrongVisitorDataProvider.future);

        Fluttertoast.showToast(
            msg: "Visitor Updates successfully !!!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            backgroundColor: Colors.red,
            fontSize: 15.0);
      } else if (userResponse.data["status"] == 0) {
        Fluttertoast.showToast(
            msg: "Visitor Updation Falied !!!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            backgroundColor: Colors.red,
            fontSize: 30.0);
        return ErrorHandler.errorDialog(userResponse.data["status"]);
      }
    } catch (e) {
      throw ErrorHandler.errorDialog(e.toString());
    }
  }
}
