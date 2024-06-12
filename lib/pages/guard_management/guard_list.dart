import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:secure_gates_admin/entities/user.dart';
import 'package:secure_gates_admin/pages/guard_management/widget/guard_card_wigdet.dart';
import 'package:secure_gates_admin/pages/user_management/widget/activate_user_loading_widget.dart';
/* import 'package:secure_gates_project/widgets/loading_widgets.dart';
import 'package:secure_gates_project/widgets/visitor_card_widget.dart';
import 'package:secure_gates_project/widgets/visitor_card_widget_second.dart'; */

import '../../auth_exception_handler.dart';
import '../../controllers/user_controller.dart';

final Dio dio = Dio();
final allActivateGuardProvider =
    FutureProvider.autoDispose<List<User>>((ref) async {
  try {
    final socCode = ref.watch(userControllerProvider).currentUser!.socCode;
    final formData = FormData.fromMap({"soc": socCode});

    final dataResponse = await dio.post(
      "https://gatesadmin.000webhostapp.com/activated_guard_list.php",
      data: formData,
    );

    if (dataResponse.data["code"] == "100") {
      final results =
          List<Map<String, dynamic>>.from(dataResponse.data["data"]);

      List<User> users = results
          .map((societyData) => User.fromMap(societyData))
          .toList(growable: false);

      return users;
    } else {
      return [];
    }
  } catch (e) {
    throw ErrorHandler.errorDialog(e);
  }
});

final allDeActivateGuardProvider =
    FutureProvider.autoDispose<List<User>>((ref) async {
  try {
    final socCode = ref.watch(userControllerProvider).currentUser!.socCode;
    final formData = FormData.fromMap({"soc": socCode});

    final dataResponse = await dio.post(
      "https://gatesadmin.000webhostapp.com/deactivated_guard_list.php",
      data: formData,
    );

    if (dataResponse.data["code"] == "100") {
      final results =
          List<Map<String, dynamic>>.from(dataResponse.data["data"]);

      List<User> user = results
          .map((societyData) => User.fromMap(societyData))
          .toList(growable: false);

      return user;
    } else {
      return [];
    }
  } catch (e) {
    throw ErrorHandler.errorDialog(e);
  }
});

class GuardList extends HookConsumerWidget {
  const GuardList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(initialLength: 2);
    final currentTabName = useState("Activated Guard");
    final allActivateUsers = ref.watch(allActivateGuardProvider);
    final allDeActivateUsers = ref.watch(allDeActivateGuardProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFF6663),
        bottom: TabBar(
          controller: tabController,
          labelColor: Colors.white,
          onTap: (value) {
            switch (value) {
              case 0:
                currentTabName.value = "Activated Guard";
                break;
              case 1:
                currentTabName.value = "De-Activated Guard";
                break;
              default:
                currentTabName.value = "Activated Guard";
            }
          },
          isScrollable: false,
          tabs: const [
            Tab(
              text: "Activated Guard",
            ),
            Tab(
              text: "De-Activated Guard",
            ),
          ],
        ),
        title: Text(
          currentTabName.value,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          RefreshIndicator(
            onRefresh: () async {
              // ignore: unused_result
              ref.refresh(allActivateGuardProvider.future);
            },
            child: ListView(
              children: [
                allActivateUsers.when(
                    skipLoadingOnRefresh: false,
                    data: (data) => data.isEmpty
                        ? Center(
                            child: Column(
                              children: [
                                // const Text("This is an empty list"),
                                Lottie.asset("assets/mt_list.json"),
                              ],
                            ),
                          )
                        : Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            child: Column(
                              children: data
                                  .map((item) => GuardCard(
                                        uid: item.uid,
                                        socCode: item.socCode,
                                        socName: item.socName,
                                        userRole: item.userRole,
                                        userFirstName: item.userFirstName,
                                        userLastName: item.userLastName,
                                        userImage: item.userImage,
                                        userNumber: item.userNumber,
                                        email: item.email,
                                        address: item.address,
                                        gender: item.gender,
                                        dob: item.dob,
                                        creationDate: item.creationDate,
                                        deactivationDate: item.deactivationDate,
                                        addedBy: item.addedBy,
                                        isActive: item.isActive,
                                      ))
                                  .toList(),
                            ),
                          ),
                    loading: () => const SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Column(
                              children: [
                                ActivateUserLoadingWidget(),
                                ActivateUserLoadingWidget(),
                                ActivateUserLoadingWidget(),
                                ActivateUserLoadingWidget(),
                                ActivateUserLoadingWidget(),
                                ActivateUserLoadingWidget(),
                                ActivateUserLoadingWidget(),
                              ],
                            ),
                          ),
                        ),
                    error: (e, s) {
                      return Text(e.toString());
                    }),
              ],
            ),
          ),
          RefreshIndicator(
            onRefresh: () async {
              // ignore: unused_result
              ref.refresh(allDeActivateGuardProvider.future);
            },
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                allDeActivateUsers.when(
                    skipLoadingOnRefresh: false,
                    data: (data) => data.isEmpty
                        ? Center(
                            child: Column(
                              children: [
                                // const Text("This is an empty list"),
                                Lottie.asset("assets/mt_list.json"),
                              ],
                            ),
                          )
                        : Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            child: Column(
                              children: data
                                  .map((item) => GuardCard(
                                        uid: item.uid,
                                        socCode: item.socCode,
                                        socName: item.socName,
                                        userRole: item.userRole,
                                        userFirstName: item.userFirstName,
                                        userLastName: item.userLastName,
                                        userImage: item.userImage,
                                        userNumber: item.userNumber,
                                        email: item.email,
                                        address: item.address,
                                        gender: item.gender,
                                        dob: item.dob,
                                        creationDate: item.creationDate,
                                        deactivationDate: item.deactivationDate,
                                        addedBy: item.addedBy,
                                        isActive: item.isActive,
                                      ))
                                  .toList(),
                            ),
                          ),
                    loading: () => const SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Column(
                              children: [
                                ActivateUserLoadingWidget(),
                                ActivateUserLoadingWidget(),
                                ActivateUserLoadingWidget(),
                                ActivateUserLoadingWidget(),
                                ActivateUserLoadingWidget(),
                                ActivateUserLoadingWidget(),
                                ActivateUserLoadingWidget(),
                              ],
                            ),
                          ),
                        ),
                    error: (e, s) {
                      return Text(e.toString());
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
