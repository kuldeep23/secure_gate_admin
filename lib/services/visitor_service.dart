import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:secure_gates_admin/controllers/user_controller.dart';
import 'package:secure_gates_admin/entities/visitor.dart';

import '../auth_exception_handler.dart';

final visitorServiceProvider = Provider<VisitorService>((ref) {
  return VisitorService(ref);
});

abstract class BaseVisitorService {
  Future<List<Visitor>> getInsideVisitors();
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
}
