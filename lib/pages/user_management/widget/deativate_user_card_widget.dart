import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:secure_gates_admin/pages/visitor_management/widget/vertical_divider_widget.dart';
import 'package:secure_gates_admin/services/user_services.dart';

class DeactivateUserCard extends HookConsumerWidget {
  DeactivateUserCard({
    super.key,
    required this.uid,
    required this.socCode,
    required this.ownerTenant,
    required this.ownerFirstName,
    required this.ownerLastName,
    required this.ownerImage,
    required this.contactNumber,
    required this.flatNumber,
    required this.updationDate,
  });

  final String uid,
      socCode,
      ownerTenant,
      ownerFirstName,
      ownerLastName,
      ownerImage,
      contactNumber,
      flatNumber,
      updationDate;

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
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(
                            ownerImage,
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
                                "$ownerFirstName $ownerLastName",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 1,
                                  horizontal: 5,
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
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 3,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xffFF6663),
                              borderRadius: BorderRadius.circular(
                                5,
                              ),
                            ),
                            child: Text(
                              ownerTenant,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 3,
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
                                "Activated on $updationDate",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey[600],
                                  height: 1.0,
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
                                Icons.apartment,
                                size: 13,
                                color: Colors.grey[600],
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                "Flat No. $flatNumber",
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
                    title: "Call User",
                    desc: "Do you  want to call the User ?",
                    btnCancelOnPress: () {},
                    btnCancelText: "No",
                    btnOkOnPress: () {
                      FlutterPhoneDirectCaller.callNumber('+91$contactNumber');
                    },
                    btnOkText: "Yes",
                  ).show(),
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.call,
                          color: Colors.green,
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
                            color: Colors.green[600],
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
                    title: "De-activate User",
                    desc: "Do you want to de-activate the user ?",
                    btnCancelOnPress: () {},
                    btnCancelText: "No",
                    btnOkOnPress: () async {
                      await ref
                          .read(societyUserProvider)
                          .deactivateUserUpdate(
                            uid,
                          )
                          .catchError((e, st) {});

                      await FlutterTts().setLanguage("en-Us");
                      await FlutterTts().setVolume(1.0);
                      await FlutterTts().setSpeechRate(0.5);
                      await FlutterTts().setPitch(1.0);
                      await FlutterTts().speak("User Deactivated Successfully");
                    },
                    btnOkText: "Yes",
                  ).show(),
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.cancel_presentation_outlined,
                          color: Colors.red,
                          size: 25,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          "De-activate",
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
