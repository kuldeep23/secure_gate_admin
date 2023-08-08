import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:secure_gates_admin/services/wrong_visitor_service.dart';

import '../../entities/wrongvisitor.dart';

final wrongVisitorDataProvider =
    FutureProvider.autoDispose<List<Wrongvisitor>>((ref) async {
  final wrongvisitors =
      ref.read(wrongVisitorServiceProvider).getWrongVisitors();

  return wrongvisitors;
});

class WrongVisitor extends HookConsumerWidget {
  const WrongVisitor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wrongvisitorData = ref.watch(wrongVisitorDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Visitor Out"),
      ),
      body: Center(
        child: wrongvisitorData.when(
            data: (data) {
              return ListView(
                children: data
                    .map(
                        (item) => /* VisitorCard(
                              visitorApproveBy: item.visitorApproveBy,
                              visitorEnterTime: item.visitorEnterTime,
                              visitorImage: item.visitorImage,
                              visitorName: item.visitorName,
                              visitorEnterDate: item.visitorEnterDate,
                              visitorStatus: item.visitorStatus,
                              visitorType: item.visitorType,
                              visitorTypeDetail: item.visitorTypeDetail,
                            ) */
                            Text(item.visitorName))
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
