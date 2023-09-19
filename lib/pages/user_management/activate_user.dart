import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:secure_gates_admin/entities/society_user.dart';
import 'package:secure_gates_admin/pages/user_management/widget/activate_user_card_wigdet.dart';

import 'package:secure_gates_admin/services/user_services.dart';

import '../visitor_management/widget/visitor_loading_widget.dart';

final allSocietyUserDataProvider =
    FutureProvider.autoDispose<List<SocietyUser>>((ref) async {
  final staff = ref.read(societyUserProvider).getActivateUser();
  return staff;
});

class ActivateUser extends HookConsumerWidget {
  const ActivateUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final societyUserData = ref.watch(allSocietyUserDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Staff-In",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: societyUserData.when(
            data: (data) {
              return RefreshIndicator(
                onRefresh: () async {
                  // ignore: unused_result
                  ref.refresh(allSocietyUserDataProvider);
                },
                child: ListView(
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
              );
            },
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
