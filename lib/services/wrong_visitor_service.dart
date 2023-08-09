// import 'package:dio/dio.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:secure_gates_admin/controllers/user_controller.dart';
// import 'package:secure_gates_admin/entities/wrongvisitor.dart';

// import '../auth_exception_handler.dart';

// final wrongVisitorServiceProvider = Provider<WrongVisitorService>((ref) {
//   return WrongVisitorService(ref);
// });

// abstract class BaseWrongVisitorService {
//   Future<List<Wrongvisitor>> getWrongVisitors();
// }

// class WrongVisitorService implements BaseWrongVisitorService {
//   final Dio _dio = Dio();
//   final Ref ref;

//   WrongVisitorService(this.ref);

//   @override
//   Future<List<Wrongvisitor>> getWrongVisitors() async {
//     try {
//       final socCode = ref.watch(userControllerProvider).currentUser!.socCode;
//       final flatNo =
//           ref.watch(userControllerProvider).currentUser!.socFlatNumber;

//       final formData = FormData.fromMap({
//         'soc': socCode,
//         'flat_no': flatNo,
//       });

//       final dataResponse = await _dio.post(
//         "https://gatesadmin.000webhostapp.com/get_wrong_visitors.php",
//         data: formData,
//       );

//       final results = List<Map<String, dynamic>>.from(dataResponse.data);

//       print(results);

//       List<Wrongvisitor> wrongvisitors = results
//           .map((visitorData) => Wrongvisitor.fromMap(visitorData))
//           .toList(growable: false);

//       print(wrongvisitors);

//       return wrongvisitors;
//     } catch (e) {
//       throw ErrorHandler.errorDialog(e);
//     }
//   }
// }
