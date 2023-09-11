import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:secure_gates_admin/entities/visitor.dart';
import 'package:secure_gates_admin/pages/visitor_management/widget/visitor_card_widget.dart';
import 'package:secure_gates_admin/services/visitor_service.dart';

final insideVisitorDataProvider =
    FutureProvider.autoDispose<List<Visitor>>((ref) async {
  final visitors = ref.read(visitorServiceProvider).getInsideVisitors();

  return visitors;
});

class VisitorOut extends HookConsumerWidget {
  const VisitorOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visitorData = ref.watch(insideVisitorDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Visitor-Out",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: visitorData.when(
            data: (data) {
              return ListView(
                children: data
                    .map((item) => VisitorCard(
                          visitorid: item.visitorId,
                          visitorApproveBy: item.visitorApproveBy,
                          visitorEnterTime: item.visitorEnterTime,
                          visitorImage: item.visitorImage,
                          visitorName: item.visitorName,
                          visitorEnterDate: item.visitorEnterDate,
                          visitorStatus: item.visitorStatus,
                          visitorType: item.visitorType,
                          visitorTypeDetail: item.visitorTypeDetail,
                          visitormobile: item.visitorMobile,
                          visitorFlatNo: item.visitorFlatNo,
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
