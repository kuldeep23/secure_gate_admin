import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:secure_gates_admin/entities/staff.dart';
import 'package:secure_gates_admin/pages/staff_management/widget/outside_staff_card_widget.dart';
import 'package:secure_gates_admin/services/staff_services.dart';

final allOutsideStaffDataProvider =
    FutureProvider.autoDispose<List<Staff>>((ref) async {
  final staff = ref.read(staffServiceProvider).getOutsideStaff();
  return staff;
});

class StaffIn extends HookConsumerWidget {
  const StaffIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final outsideStaffData = ref.watch(allOutsideStaffDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Staff-In"),
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
