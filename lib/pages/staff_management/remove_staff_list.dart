import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:secure_gates_admin/entities/staff.dart';
import 'package:secure_gates_admin/pages/staff_management/widget/remove_staff_list_card_widget.dart';
import 'package:secure_gates_admin/services/staff_services.dart';

import '../visitor_management/widget/visitor_loading_widget.dart';

final allStaffListDataProvider =
    FutureProvider.autoDispose<List<Staff>>((ref) async {
  final staff = ref.read(staffServiceProvider).getAllStaff();
  return staff;
});

class RemoveStaffList extends HookConsumerWidget {
  const RemoveStaffList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final outsideStaffData = ref.watch(allStaffListDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Staff-List",
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
                      ref.refresh(allStaffListDataProvider.future);
                    },
                    child: ListView(
                      children: data
                          .map((item) => RemoveStaffListCard(
                                uid: item.uid,
                                socCode: item.socCode,
                                staffName: item.staffName,
                                staffType: item.staffType,
                                staffFlatNo: item.staffFlatNo,
                                staffIcon: item.staffIcon,
                                staffStatus: item.staffStatus,
                                lastEnterDate: item.lastEnterDate,
                                lastEnterTime: item.lastEnterTime,
                                lastEnterBy: item.lastEnterBy,
                                lastExistDate: item.lastExistDate,
                                lastExistTime: item.lastExistTime,
                                lastExistBy: item.lastExistBy,
                                staffMobileNo: item.staffMobileNo,
                                staffRating: item.staffRating,
                                staffCreationDate: item.staffCreationDate,
                                staffCreatedBy: item.staffCreatedBy,
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
