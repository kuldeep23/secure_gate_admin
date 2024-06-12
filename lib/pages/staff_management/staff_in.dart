import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:secure_gates_admin/entities/staff.dart';
import 'package:secure_gates_admin/pages/staff_management/widget/outside_staff_card_widget.dart';
import 'package:secure_gates_admin/services/staff_services.dart';

import '../visitor_management/widget/visitor_loading_widget.dart';

final allOutsideStaffDataProvider =
    FutureProvider.autoDispose<List<Staff>>((ref) async {
  final staff = ref.read(staffServiceProvider).getOutsideStaff();
  return staff;
});

class StaffIn extends HookConsumerWidget {
  const StaffIn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final outsideStaffData = ref.watch(allOutsideStaffDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Staff-In",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: outsideStaffData.when(
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
                      ref.refresh(allOutsideStaffDataProvider.future);
                    },
                    child: ListView(
                      children: data
                          .map((item) => StaffCard(
                                uid: item.uid,
                                socCode: item.socCode,
                                staffName: item.staffName,
                                staffType: item.staffType,
                                staffFlatNo: item.staffFlatNo,
                                staffIcon: item.staffIcon,
                                staffStatus: item.staffStatus,
                                lastExistDate: item.lastExistDate,
                                lastExistTime: item.lastExistTime,
                                lastExistBy: item.lastExistBy,
                                staffMobileNo: item.staffMobileNo,
                                staffRating: item.staffRating,
                                staffCreationDate: item.staffCreationDate,
                                staffDeactivateDate: item.staffDeactivateDate,
                                staffIsActive: item.staffIsActive,
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
