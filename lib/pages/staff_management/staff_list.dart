import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:secure_gates_admin/general_providers.dart';
import '../../controllers/user_controller.dart';
import '../../entities/staffList.dart';
import '../../routes/app_routes_constants.dart';

final staffListProvider =
    FutureProvider.autoDispose<List<StaffList>>((ref) async {
  final socCode = ref.read(userControllerProvider).currentUser!.socCode;

  final data = FormData.fromMap({'soc': socCode});

  final response = await Dio().post(
    "${ref.read(generalUrlPathProvider)}/staff_list.php",
    data: data,
  );

  final results = List<Map<String, dynamic>>.from(response.data);

  List<StaffList> staffList = results
      .map((staffData) => StaffList.fromMap(staffData))
      .toList(growable: false);

  return staffList;
});

class StaffListPage extends HookConsumerWidget {
  const StaffListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final staffList = ref.watch(staffListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Staff List",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          staffList.when(
              data: (data) => Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                    ),
                    child: Column(
                      children: data
                          .map(
                            (item) => Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    context.pushNamed(
                                      MyAppRoutes.domesticStaffMembersPage,
                                      extra: item.staffType,
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    child: ListTile(
                                      tileColor: Colors.white,
                                      focusColor: Colors.grey,
                                      title: Row(
                                        children: [
                                          Text(item.staffType),
                                        ],
                                      ),
                                      trailing: Wrap(
                                        spacing: 15,
                                        children: [
                                          Text(
                                            item.count,
                                            style:
                                                const TextStyle(fontSize: 15),
                                          ),
                                          const Icon(
                                            Icons.arrow_forward_ios_sharp,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, s) {
                return Text(e.toString());
              }),
        ],
      ),
    );
  }
}
