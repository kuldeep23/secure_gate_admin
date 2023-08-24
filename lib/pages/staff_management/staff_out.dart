import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:secure_gates_admin/pages/staff_management/widget/inside_staff_card_widget.dart';

import '../../entities/staff.dart';
import '../../services/staff_services.dart';


final allInsideStaffDataProvider =
    FutureProvider.autoDispose<List<Staff>>((ref) async {
  final staff = ref.read(staffServiceProvider).getInsideStaff();
  return staff;
});

class StaffOut extends HookConsumerWidget {
  const StaffOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final outsideStaffData = ref.watch(allInsideStaffDataProvider); 

    return Scaffold(
      appBar: AppBar(
        title: const Text("Staff-Out"),
      ),
      body: Center(
        child: outsideStaffData.when(
            data: (data) {
              return ListView(
                children: data
                    .map((item) => StaffCard(
                          uid: item.uid,
                          socCode: item.socCode,
                          staffName: item.staffName,
                          staffType: item.staffType,
                          staffIcon: item.staffIcon,
                          staffStatus: item.staffStatus,
                          lastEnterDate: item.lastEnterDate,
                          lastEnterTime: item.lastEnterTime,
                          staffMobileNo: item.staffMobileNo,
                          staffRating: item.staffRating,
                          staffCreationDate: item.staffCreationDate,
                          staffDeactivateDate: item.staffDeactivateDate,
                          staffIsActive: item.staffIsActive,
                        ))
                    .toList(),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, s) {
              return Text(e.toString());
            }),
      ),
    );
  }
}
