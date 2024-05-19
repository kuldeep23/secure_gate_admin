import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:secure_gates_admin/entities/society_user.dart';
import 'package:secure_gates_admin/pages/user_management/widget/activate_user_card_wigdet.dart';
import 'package:secure_gates_admin/pages/user_management/widget/activate_user_loading_widget.dart';
/* import 'package:secure_gates_project/widgets/loading_widgets.dart';
import 'package:secure_gates_project/widgets/visitor_card_widget.dart';
import 'package:secure_gates_project/widgets/visitor_card_widget_second.dart'; */

import '../../auth_exception_handler.dart';
import '../../controllers/user_controller.dart';

final Dio dio = Dio();
final allActivateUserProvider =
    FutureProvider.autoDispose<List<SocietyUser>>((ref) async {
  try {
    final socCode = ref.watch(userControllerProvider).currentUser!.socCode;
    final formData = FormData.fromMap({"soc": socCode});

    final dataResponse = await dio.post(
      "https://gatesadmin.000webhostapp.com/activate_user_list.php",
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
});

final allDeActivateUserProvider =
    FutureProvider.autoDispose<List<SocietyUser>>((ref) async {
  try {
    final socCode = ref.watch(userControllerProvider).currentUser!.socCode;
    final formData = FormData.fromMap({"soc": socCode});

    final dataResponse = await dio.post(
      "https://gatesadmin.000webhostapp.com/deactivate_user_list.php",
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
});

class UserList extends HookConsumerWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(initialLength: 2);
    final currentTabName = useState("Activated User");
    final allActivateUsers = ref.watch(allActivateUserProvider);
    final allDeActivateUsers = ref.watch(allDeActivateUserProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFF6663),
        bottom: TabBar(
          controller: tabController,
          labelColor: Colors.white,
          onTap: (value) {
            switch (value) {
              case 0:
                currentTabName.value = "Activated User";
                break;
              case 1:
                currentTabName.value = "De-Activated User";
                break;
              default:
                currentTabName.value = "Activated User";
            }
          },
          isScrollable: false,
          tabs: const [
            Tab(
              text: "Activated User",
            ),
            Tab(
              text: "De-Activated User",
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
              ref.refresh(allActivateUserProvider.future);
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
                                  .map((item) => SocietyUserCard(
                                        uid: item.uid,
                                        socCode: item.socCode,
                                        ownerTenant: item.ownerTenant,
                                        ownerFirstName: item.ownerFirstName,
                                        ownerLastName: item.ownerLastName,
                                        ownerImage: item.ownerImage,
                                        contactNumber: item.contactNumber,
                                        flatNumber: item.flatNumber,
                                        creationDate: item.creationDate,
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
              ref.refresh(allDeActivateUserProvider.future);
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
                                  .map((item) => SocietyUserCard(
                                        uid: item.uid,
                                        socCode: item.socCode,
                                        ownerTenant: item.ownerTenant,
                                        ownerFirstName: item.ownerFirstName,
                                        ownerLastName: item.ownerLastName,
                                        ownerImage: item.ownerImage,
                                        contactNumber: item.contactNumber,
                                        flatNumber: item.flatNumber,
                                        creationDate: item.creationDate,
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
