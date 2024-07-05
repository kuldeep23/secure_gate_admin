import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:secure_gates_admin/pages/visitor_management/widget/visitor_loading_widget.dart';
import 'package:secure_gates_admin/pages/visitor_management/widget/wrong_visitor_card_widget.dart';
import '../../entities/wrongvisitor.dart';
import '../../services/visitor_service.dart';

final wrongVisitorDataProvider =
    FutureProvider.autoDispose<List<Wrongvisitor>>((ref) async {
  final wrongvisitors = VisitorService(ref).getWrongVisitors();
  return wrongvisitors;
});

class WrongVisitor extends HookConsumerWidget {
  const WrongVisitor({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wrongvisitorData = ref.watch(wrongVisitorDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Wrong-Visitors",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: wrongvisitorData.when(
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
                      ref.refresh(wrongVisitorDataProvider.future);
                    },
                    child: ListView(
                      children: data
                          .map((item) => WrongVisitorCard(
                                visitorimage: item.visitorName,
                                visitorsoccode: item.socCode,
                                visitorid: item.visitorId,
                                visitorApproveBy: item.visitorId,
                                visitorEnterTime: item.visitorId,
                                visitorImage: item.visitorImage,
                                visitorName: item.visitorName,
                                visitorEnterDate: item.visitorId,
                                visitorStatus: item.visitorId,
                                visitorType: item.visitorType,
                                visitorTypeDetail: item.visitorTypeDetail,
                                visitormobile: item.visitorMobile,
                                visitorReview: item.visitorId,
                                visitorId: item.visitorId,
                                visitorFlatNo: item.visitorFlatNo,
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
