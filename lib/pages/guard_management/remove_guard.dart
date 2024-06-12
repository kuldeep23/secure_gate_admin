import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:secure_gates_admin/entities/user.dart';
import 'package:secure_gates_admin/pages/guard_management/widget/user_list_card_widget.dart';
import 'package:secure_gates_admin/services/guard_services.dart';


import '../visitor_management/widget/visitor_loading_widget.dart';

final allUserfListDataProvider =
    FutureProvider.autoDispose<List<User>>((ref) async {
  final staff = ref.read(userServiceProvider).getUserList();
  return staff;
});

class RemoveGuardList extends HookConsumerWidget {
  const RemoveGuardList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(allUserfListDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Guard-List",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: userData.when(
            skipLoadingOnRefresh: false,
            data: (data) => data.isEmpty
                ? Center(
                    child: Column(
                      children: [
                        Lottie.asset("assets/mt_list.json"),
                      ],
                    ),
                  )
                : RefreshIndicator(
                    onRefresh: () async {
                      // ignore: unused_result
                      ref.refresh(allUserfListDataProvider.future);
                    },
                    child: ListView(
                      children: data
                          .map((item) => UserListCard(
                                uid: item.uid,
                                socCode: item.socCode,
                                socName: item.socName,
                                userRole: item.userRole,
                                userFirstName: item.userFirstName,
                                userLastName: item.userLastName,
                                userImage: item.userImage,
                                userNumber: item.userNumber,
                                email: item.email,
                                password: item.password,
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
                        CurrentVisitorLoadingWidget(),
                        CurrentVisitorLoadingWidget(),
                        CurrentVisitorLoadingWidget(),
                        CurrentVisitorLoadingWidget(),
                        CurrentVisitorLoadingWidget(),
                        CurrentVisitorLoadingWidget(),
                      ],
                    ),
                  ),
                ),
            error: (e, s) {
              return Text(e.toString());
            }),
      ),
    );
  }
}
