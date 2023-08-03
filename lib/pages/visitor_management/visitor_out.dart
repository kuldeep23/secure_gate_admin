import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:secure_gates_admin/entities/visitor.dart';
import 'package:secure_gates_admin/services/visitor_service.dart';

final insideVisitorDataProvider =
    FutureProvider.autoDispose<List<Visitor>>((ref) async {
  final visitors = VisitorService(ref).getInsideVisitors();

  return visitors;
});

class VisitorOut extends HookConsumerWidget {
  const VisitorOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visitorData = ref.watch(insideVisitorDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Visitor-Out"),
      ),
      body: Center(
        child: visitorData.when(
            data: (data) {
              return ListView(
                children: data
                    .map((item) => Card(
                          child: Row(
                            children: [
                              Image.network(item.visitorImage),
                              Text(item.visitorName),
                            ],
                          ),
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
