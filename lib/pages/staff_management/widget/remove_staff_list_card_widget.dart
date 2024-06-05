import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:secure_gates_admin/pages/visitor_management/widget/vertical_divider_widget.dart';
import 'package:secure_gates_admin/services/staff_services.dart';

class RemoveStaffListCard extends HookConsumerWidget {
  RemoveStaffListCard({
    super.key,
    required this.uid,
    required this.socCode,
    required this.staffName,
    required this.staffType,
    required this.staffFlatNo,
    required this.staffIcon,
    required this.staffStatus,
    required this.lastEnterDate,
    required this.lastEnterTime,
    required this.lastEnterBy,
    required this.lastExistDate,
    required this.lastExistTime,
    required this.lastExistBy,
    required this.staffMobileNo,
    required this.staffRating,
    required this.staffCreationDate,
    required this.staffCreatedBy,
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
      lastEnterDate,
      lastEnterTime,
      lastEnterBy,
      lastExistDate,
      lastExistTime,
      lastExistBy,
      staffMobileNo,
      staffRating,
      staffCreationDate,
      staffCreatedBy,
      staffDeactivateDate,
      staffIsActive;

  final TextEditingController feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        quickDialogue(
          callBack: () {},
          subtitle: staffStatus,
          title: staffName,
          visitormobile: staffMobileNo,
          visitorType: staffType,
          context: context,
          inTime: staffCreationDate,
          inDate: staffCreationDate,
          outTime: staffStatus,
          outDate: staffStatus,
          allowedBy: staffStatus,
          visitorTypeDetail: staffType,
          phoneNo: staffMobileNo,
          image: NetworkImage(
            staffIcon,
          ),
        );
      },
      child: Card(
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
                            radius: 32,
                            backgroundImage: NetworkImage(
                              staffIcon,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 1,
                              horizontal: 5,
                            ),
                            decoration: BoxDecoration(
                              color: staffStatus == "Inside"
                                  ? const Color(0xffFF6663)
                                  : Colors.green[600],
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
                                    vertical: 1,
                                    horizontal: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 102, 102, 216),
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
                                  Iconsax.user_add,
                                  size: 13,
                                  color: Colors.grey[600],
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  "Added by $staffCreatedBy ",
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
                      btnCancelOnPress: () {
                        Navigator.of(context).pop();
                      },
                      btnCancelText: "No",
                      btnOkOnPress: () {
                        FlutterPhoneDirectCaller.callNumber(
                            '+91$staffMobileNo');
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
                            size: 20,
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
                    onTap: () {
                      if (staffStatus == "Inside") {
                        AwesomeDialog(
                          context: context,
                          transitionAnimationDuration:
                              const Duration(milliseconds: 400),
                          dialogType: DialogType.warning,
                          animType: AnimType.scale,
                          title: "Staff Inside",
                          desc: "Please let $staffName leave the society first",
                          btnCancelOnPress: () {},
                          btnCancelText: "No",
                          btnOkOnPress: () async {
                            await ref
                                .read(staffServiceProvider)
                                .staffExist(
                                  uid,
                                  socCode,
                                )
                                .catchError((e, st) {});

                            await FlutterTts().setLanguage("en-Us");
                            await FlutterTts().setVolume(1.0);
                            await FlutterTts().setSpeechRate(0.5);
                            await FlutterTts().setPitch(1.0);
                            await FlutterTts().speak("Staff Exit Successfully");
                          },
                          btnOkText: "Yes",
                        ).show();
                      } else if (staffStatus == "Outside") {
                        AwesomeDialog(
                          context: context,
                          transitionAnimationDuration:
                              const Duration(milliseconds: 400),
                          dialogType: DialogType.question,
                          animType: AnimType.scale,
                          title: "Remove Staff",
                          desc: "Do you want to remove the staff ?",
                          btnCancelOnPress: () {},
                          btnCancelText: "No",
                          btnOkOnPress: () async {
                            await ref
                                .read(staffServiceProvider)
                                .staffRemove(uid)
                                .catchError((e, st) {});

                            await FlutterTts().setLanguage("en-Us");
                            await FlutterTts().setVolume(1.0);
                            await FlutterTts().setSpeechRate(0.5);
                            await FlutterTts().setPitch(1.0);
                            await FlutterTts()
                                .speak("Staff Removed Successfully");
                          },
                          btnOkText: "Yes",
                        ).show();
                      }
                    },

                    /* AwesomeDialog(
                      context: context,
                      transitionAnimationDuration:
                          const Duration(milliseconds: 400),
                      dialogType: DialogType.question,
                      animType: AnimType.scale,
                      title: "Remove Staff",
                      desc: "Do you want to remove the staff ?",
                      btnCancelOnPress: () {},
                      btnCancelText: "No",
                      btnOkOnPress: () {
                        if (staffStatus == "Inside") {
                          AwesomeDialog(
                            context: context,
                            transitionAnimationDuration:
                                const Duration(milliseconds: 400),
                            dialogType: DialogType.question,
                            animType: AnimType.scale,
                            title: "Staff Inside",
                            desc: "Do you want to remove $staffName the staff ?",
                            btnCancelOnPress: () {},
                            btnCancelText: "No",
                            btnOkOnPress: () {},
                            btnOkText: "Yes",
                          ).show();
                        }
                      },
                      /* async {
                        await ref
                            .read(staffServiceProvider)
                            .staffExist(
                              uid,
                              socCode,
                            )
                            .catchError((e, st) {});
    
                        await FlutterTts().setLanguage("en-Us");
                        await FlutterTts().setVolume(1.0);
                        await FlutterTts().setSpeechRate(0.5);
                        await FlutterTts().setPitch(1.0);
                        await FlutterTts().speak("Staff Exit Successfully");
                      } */
    
                      btnOkText: "Yes",
                    ).show(), */
                    child: SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const RotatedBox(
                            quarterTurns: 2,
                            child: Icon(
                              Icons.cancel_outlined,
                              color: Colors.red,
                              size: 20,
                            ),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            "Remove",
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
    await showGeneralDialog(
      transitionDuration: const Duration(milliseconds: 600),
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.85),
      context: context,
      pageBuilder: (context, a1, a2) {
        return Container();
      },
      transitionBuilder: (context, a1, a2, widget) {
        return ScaleTransition(
          scale: Tween(begin: 0.5, end: 1.0).animate(a1),
          child: FadeTransition(
            opacity: Tween(begin: 0.5, end: 1.0).animate(a1),
            child: Theme(
              data: Theme.of(context)
                  .copyWith(dialogBackgroundColor: Colors.white),
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
                          /* Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  HeroPhotoViewRouteWrapper(imageProvider: image),
                            ),
                          ); */
                        },
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.phone_android_outlined,
                              size: 14,
                              color: Colors.grey[600],
                            ),
                            Text(
                              phoneNo,
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                            ),
                          ],
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
                          Icon(
                            Icons.check_circle_outline,
                            size: 14,
                            color: Colors.grey[600],
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            "Last Enter By $lastEnterBy",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                              height: 1.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Icon(
                            Icons.logout,
                            size: 14,
                            color: Colors.grey[600],
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            "$lastEnterTime, $lastEnterDate",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                              height: 1.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            size: 14,
                            color: Colors.grey[600],
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            "Last Exit By $lastExistBy",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                              height: 1.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          RotatedBox(
                            quarterTurns: 2,
                            child: Icon(
                              Icons.logout,
                              size: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            "$lastExistTime, $lastExistDate",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                              height: 1.0,
                            ),
                          ),
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
                        title: "Call $staffType",
                        desc: "Do you really want to call $staffName ?",
                        btnCancelOnPress: () {},
                        btnCancelText: "No",
                        btnOkOnPress: () {
                          FlutterPhoneDirectCaller.callNumber(
                              '+91$visitormobile');
                        },
                        btnOkText: "Yes",
                      ).show(),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: const BoxDecoration(
                          color: Color(0xffFF6663),
                          // gradient: gradient.LinearGradient(
                          //   colors: [
                          //     Color(0xffFF6663),
                          //     Color(0xff0083B0),
                          //   ],
                          //   begin: Alignment.topCenter, //begin of the gradient color
                          //   end: Alignment.bottomCenter, //end of the gradient color
                          //   //stops for individual color
                          //   //set the stops number equal to numbers of color
                          // ),
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
            ),
          ),
        );
      },
    );
  }
}
