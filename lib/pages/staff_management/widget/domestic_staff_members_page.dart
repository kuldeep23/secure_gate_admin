import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
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
                                /* context.pushNamed(
                                  MyAppRoutes.domesticStaffMembersDetailsPage,
                                  extra: item,
                                ); */
                                quickDialogue(
                                  callBack: () {},
                                  subtitle: item.staffStatus,
                                  title: item.staffName,
                                  visitormobile: item.staffMobileNo,
                                  visitorType: item.staffType,
                                  context: context,
                                  inTime: item.staffCreationDate,
                                  inDate: item.staffCreationDate,
                                  outTime: item.staffStatus ?? "Still Inside",
                                  outDate: item.staffStatus ?? "Still Inside",
                                  allowedBy: item.staffStatus,
                                  visitorTypeDetail: item.staffType,
                                  phoneNo: item.staffMobileNo,
                                  image: NetworkImage(
                                    item.staffIcon,
                                  ),
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
                                                        fontSize: 20,
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

  Future<void> quickDialogue({
    Color dialogueThemeColor = const Color(0xffFF6663),
    required void Function() callBack,
    String discardTitle = 'Cancel',
    String submitTitle = 'Okay',
    required String visitorType,
    required String subtitle,
    bool onlyShow = false,
    required String title,
    required BuildContext context,
    required ImageProvider image,
    required String inTime,
    required String inDate,
    required String outTime,
    required String visitormobile,
    required String outDate,
    required String allowedBy,
    required String visitorTypeDetail,
    required String phoneNo,
  }) async {
    await showAnimatedDialog(
      duration: const Duration(milliseconds: 600),
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.85),
      animationType: DialogTransitionType.fadeScale,
      context: context,
      builder: (context) {
        return Theme(
          data: Theme.of(context).copyWith(dialogBackgroundColor: Colors.white),
          child: AlertDialog(
            contentPadding: const EdgeInsets.all(0.0),
            //insetPadding: EdgeInsets.all(5),
            titlePadding: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: SizedBox(
              width: 800,
              child: Column(
                children: [
                  Transform.translate(
                    offset: const Offset(0, -50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 25,
                        ),
                        Text(
                          visitorType,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      /* 
                      Navigator.push(
                        context,
                         MaterialPageRoute(
                        builder: (context) =>
                            HeroPhotoViewRouteWrapper(imageProvider: image),
                      ), *
                      ); */
                    },
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      child: Hero(
                        tag: image,
                        child: Image(
                          image: image,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 3,
                        horizontal: 3,
                      ),
                      decoration: BoxDecoration(
                        color: subtitle == "Inside"
                            ? const Color(0xffEA7255)
                            : Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Text(
                        subtitle.toUpperCase(),
                        style:
                            const TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      phoneNo,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Divider(),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.logout,
                        size: 15,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${inTime.toUpperCase()}, ",
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        inDate,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      const RotatedBox(
                        quarterTurns: 2,
                        child: Icon(
                          Icons.logout,
                          size: 15,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                          outTime.isEmpty
                              ? "Still Inside"
                              : "${outTime.toUpperCase()}, ",
                          style: const TextStyle(
                            fontSize: 16,
                          )),
                      Text(outDate,
                          style: const TextStyle(
                            fontSize: 16,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.person_outline,
                        size: 15,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text("Allowed by $allowedBy",
                          style: const TextStyle(
                            fontSize: 16,
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.store,
                        size: 15,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(visitorTypeDetail,
                          style: const TextStyle(
                            fontSize: 16,
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: 7),
                InkWell(
                  onTap: () => AwesomeDialog(
                    context: context,
                    transitionAnimationDuration:
                        const Duration(milliseconds: 400),
                    dialogType: DialogType.question,
                    animType: AnimType.scale,
                    title: "Call Visitor",
                    desc: "Do you really want to call visitor ?",
                    btnCancelOnPress: () {},
                    btnCancelText: "No",
                    btnOkOnPress: () {
                      FlutterPhoneDirectCaller.callNumber('+91$visitormobile');
                    },
                    btnOkText: "Yes",
                  ).show(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: const BoxDecoration(
                      color: Color(0xffFF6663),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(
                          20,
                        ),
                        bottomRight: Radius.circular(
                          20,
                        ),
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
