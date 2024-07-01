import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:secure_gates_admin/pages/visitor_management/widget/vertical_divider_widget.dart';

class GuardCard extends HookConsumerWidget {
  GuardCard({
    super.key,
    required this.uid,
    required this.socCode,
    required this.socName,
    required this.userRole,
    required this.userFirstName,
    required this.userLastName,
    required this.userImage,
    required this.userNumber,
    required this.email,
    required this.address,
    required this.gender,
    required this.dob,
    required this.creationDate,
    required this.deactivationDate,
    required this.addedBy,
    required this.isActive,
  });

  final String uid,
      socCode,
      socName,
      userRole,
      userFirstName,
      userLastName,
      userImage,
      userNumber,
      email,
      address,
      gender,
      dob,
      creationDate,
      deactivationDate,
      addedBy,
      isActive;

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
                            userImage,
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
                                "$userFirstName $userLastName",
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
                              userRole,
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
                                "Apply on $creationDate",
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
                                "Flat No. $userNumber",
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
                      FlutterPhoneDirectCaller.callNumber('+91$userNumber');
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
                    title: "Update User",
                    desc: "Do you want to update the user ?",
                    btnCancelOnPress: () {},
                    btnCancelText: "No",
                    btnOkOnPress: () {
                      /* Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpdateUserCard(
                                    id: uid,
                                    ownerFirstName: ownerFirstName,
                                    ownerLastName: ownerLastName,
                                    ownerTenant: ownerTenant,
                                    ownerImage: ownerImage,
                                    flatNumber: flatNumber,
                                  ))); */
                    },
                    btnOkText: "Yes",
                  ).show(),
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.verified_user_outlined,
                          color: Colors.green,
                          size: 25,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          "Update",
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
