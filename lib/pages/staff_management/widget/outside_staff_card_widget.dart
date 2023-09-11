import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:secure_gates_admin/pages/visitor_management/widget/vertical_divider_widget.dart';
import 'package:secure_gates_admin/services/staff_services.dart';

class StaffCard extends HookConsumerWidget {
  StaffCard({
    super.key,
    required this.uid,
    required this.socCode,
    required this.staffName,
    required this.staffType,
    required this.staffFlatNo,
    required this.staffIcon,
    required this.staffStatus,
    required this.lastExistDate,
    required this.lastExistTime,
    required this.lastExistBy,
    required this.staffMobileNo,
    required this.staffRating,
    required this.staffCreationDate,
    required this.staffDeactivateDate,
    required this.staffIsActive,
  });

  final String uid,
      socCode,
      staffName,
      staffType,
      staffFlatNo,
      staffIcon,
      staffStatus,
      lastExistDate,
      lastExistTime,
      lastExistBy,
      staffMobileNo,
      staffRating,
      staffCreationDate,
      staffDeactivateDate,
      staffIsActive;

  final TextEditingController feedbackController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 5,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        child: Column(
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 1,
                            horizontal: 5,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xff65CC5B),
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: Text(
                            staffStatus.toUpperCase(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CircleAvatar(
                          radius: 32,
                          backgroundImage: NetworkImage(
                            staffIcon,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const VerticalDivider(
                    width: 15,
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                staffName,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 3,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 102, 102, 216),
                                  borderRadius: BorderRadius.circular(
                                    5,
                                  ),
                                ),
                                child: Text(
                                  "ID : $uid",
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 3,
                              vertical: 1,
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 231, 102, 99),
                              borderRadius: BorderRadius.circular(
                                5,
                              ),
                            ),
                            child: Text(
                              staffType,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Row(
                            children: [
                              Icon(
                                Iconsax.user_add,
                                size: 13,
                                color: Colors.grey[600],
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                "Added on $staffCreationDate",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey[600],
                                  height: 1,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.check_circle_outline,
                                size: 13,
                                color: Colors.grey[600],
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                "Last Exist By $lastExistBy",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey[600],
                                  height: 1.0,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              RotatedBox(
                                quarterTurns: 2,
                                child: Icon(
                                  Icons.logout,
                                  size: 13,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                "$lastExistTime, $lastExistDate",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey[600],
                                  height: 1.2,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.apartment,
                                size: 13,
                                color: Colors.grey[600],
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                "Work in Flat No. $staffFlatNo",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey[600],
                                  height: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => AwesomeDialog(
                    context: context,
                    transitionAnimationDuration:
                        const Duration(milliseconds: 400),
                    dialogType: DialogType.question,
                    animType: AnimType.scale,
                    title: "Call Staff",
                    desc: "Do you  want to call the staff ?",
                    btnCancelOnPress: () {},
                    btnCancelText: "No",
                    btnOkOnPress: () {
                      FlutterPhoneDirectCaller.callNumber('+91$staffMobileNo');
                    },
                    btnOkText: "Yes",
                  ).show(),
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.call,
                          color: Colors.red,
                          size: 25,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          "Call",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.red[600],
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const VerticallyDivider(
                  width: 1,
                  color: Colors.grey,
                ),
                GestureDetector(
                  // ignore: avoid_print
                  onTap: () => AwesomeDialog(
                    context: context,
                    transitionAnimationDuration:
                        const Duration(milliseconds: 400),
                    dialogType: DialogType.question,
                    animType: AnimType.scale,
                    title: "Enter Staff",
                    desc: "Do you want to enter the staff ?",
                    btnCancelOnPress: () {},
                    btnCancelText: "No",
                    btnOkOnPress: () async {
                      await ref
                          .read(staffServiceProvider)
                          .staffEnter(
                            uid,
                            socCode,
                          )
                          .catchError((e, st) {});

                      await FlutterTts().setLanguage("en-Us");
                      await FlutterTts().setVolume(1.0);
                      await FlutterTts().setSpeechRate(0.5);
                      await FlutterTts().setPitch(1.0);
                      await FlutterTts().speak("Staff Entered Successfully");
                    },
                    btnOkText: "Yes",
                  ).show(),
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.login_outlined,
                          color: Colors.green,
                          size: 25,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          "Enter",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[600],
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
