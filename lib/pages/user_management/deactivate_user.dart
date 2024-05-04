import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:secure_gates_admin/entities/society_user.dart';
import 'package:secure_gates_admin/pages/user_management/widget/deactivate_user_loading_widget.dart';
import 'package:secure_gates_admin/pages/user_management/widget/deativate_user_card_widget.dart';
import 'package:secure_gates_admin/services/user_services.dart';

final allSocietyUserDataProvider =
    FutureProvider.autoDispose<List<SocietyUser>>((ref) async {
  final staff = ref.read(societyUserProvider).getdeActivateUser();
  return staff;
});

class DeActivateUser extends HookConsumerWidget {
  const DeActivateUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final societyUserData = ref.watch(allSocietyUserDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Deactivate User",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: societyUserData.when(
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
                      ref.refresh(allSocietyUserDataProvider.future);
                    },
                    child: ListView(
                      children: data
                          .map((item) => DeactivateUserCard(
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
                        DeActivateUserLoadingWidget(),
                        DeActivateUserLoadingWidget(),
                        DeActivateUserLoadingWidget(),
                        DeActivateUserLoadingWidget(),
                        DeActivateUserLoadingWidget(),
                        DeActivateUserLoadingWidget(),
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
