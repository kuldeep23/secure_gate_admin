import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../controllers/user_controller.dart';
import '../../../entities/staff.dart';
import '../../../routes/app_routes_constants.dart';

final staffMemberProvider = FutureProvider.autoDispose
    .family<List<Staff>, String>((ref, staffType) async {
  final socCode = ref.read(userControllerProvider).currentUser!.socCode;

  final data = FormData.fromMap({'soc': socCode, 'staff_type': staffType});

  final response = await Dio().post(
    "https://gatesadmin.000webhostapp.com/staff_member.php",
    data: data,
  );
  ref.keepAlive();

  final results = List<Map<String, dynamic>>.from(response.data);

  List<Staff> staffList = results
      .map((staffData) => Staff.fromMap(staffData))
      .toList(growable: false);

  return staffList;
});

class DomesticStaffMembersPage extends HookConsumerWidget {
  const DomesticStaffMembersPage({super.key, required this.staffType});

  final String staffType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final staffTypeMembers = ref.watch(staffMemberProvider(staffType));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          staffType,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  "Inside",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          staffTypeMembers.when(
              data: (data) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    child: Column(
                      children: data
                          .map(
                            (item) => GestureDetector(
                              onTap: () {
                                context.pushNamed(
                                  MyAppRoutes.domesticStaffMembersDetailsPage,
                                  extra: item,
                                );
                              },
                              child: Card(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15,
                                        vertical: 10,
                                      ),
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 32,
                                                      backgroundImage:
                                                          NetworkImage(
                                                        item.staffIcon,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 1,
                                                  horizontal: 5,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: item.staffStatus ==
                                                          "Inside"
                                                      ? const Color(0xffFF6663)
                                                      : Colors.green[600],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    10,
                                                  ),
                                                ),
                                                child: Text(
                                                  item.staffStatus
                                                      .toUpperCase(),
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      item.staffName,
                                                      style: const TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                        vertical: 1,
                                                        horizontal: 5,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: const Color
                                                                .fromARGB(
                                                            255, 102, 102, 216),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          5,
                                                        ),
                                                      ),
                                                      child: Text(
                                                        "ID : ${item.uid}",
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  "Rating ⭐️${item.staffRating}",
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                Text(
                                                  "Works in H.No. ${item.staffFlatNo}",
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, s) {
                return Text(e.toString());
              }),
        ],
      ),
    );
  }
}
