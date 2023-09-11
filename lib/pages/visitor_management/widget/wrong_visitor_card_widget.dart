import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:secure_gates_admin/pages/visitor_management/widget/responsive_wrap.dart';
import 'package:secure_gates_admin/pages/visitor_management/widget/vertical_divider_widget.dart';
import 'package:secure_gates_admin/services/visitor_service.dart';

class WrongVisitorCard extends HookConsumerWidget {
  WrongVisitorCard({
    super.key,
    required this.visitorApproveBy,
    required this.visitorEnterTime,
    required this.visitorImage,
    required this.visitorName,
    required this.visitorStatus,
    required this.visitorType,
    required this.visitorEnterDate,
    required this.visitorTypeDetail,
    required this.visitorid,
    required this.visitormobile,
    required this.visitorsoccode,
    required this.visitorimage,
    required this.visitorReview,
    required this.visitorId,
    required this.visitorFlatNo,
  });

  final String visitorImage,
      visitorName,
      visitorType,
      visitorStatus,
      visitorTypeDetail,
      visitorApproveBy,
      visitorEnterTime,
      visitorEnterDate,
      visitorid,
      visitormobile,
      visitorsoccode,
      visitorimage,
      visitorReview,
      visitorId,
      visitorFlatNo;

  final TextEditingController feedbackController = TextEditingController();
  final TextEditingController flatController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 10,
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
                            visitorImage,
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
                            color: const Color.fromARGB(255, 34, 74, 103),
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: Text(
                            visitorStatus.toUpperCase(),
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
                        horizontal: 5,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "$visitorName, $visitorTypeDetail",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 1,
                                  horizontal: 3,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 102, 102, 216),
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                ),
                                child: Text(
                                  "ID : $visitorId",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 13),
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
                              color: const Color(0xff6CB4EE),
                              borderRadius: BorderRadius.circular(
                                5,
                              ),
                            ),
                            child: Text(
                              visitorType,
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
                                Icons.check_circle_outline,
                                size: 13,
                                color: Colors.grey[600],
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                "Allowed by $visitorApproveBy",
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
                                Icons.schedule_outlined,
                                size: 13,
                                color: Colors.grey[600],
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                "Entered at $visitorEnterTime",
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
                                Icons.calendar_month_outlined,
                                size: 13,
                                color: Colors.grey[600],
                              ),
                              Text(
                                visitorEnterDate,
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
                                "Flat No $visitorFlatNo",
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
                  // ignore: avoid_print
                  onTap: () => AwesomeDialog(
                    body: TextField(
                      maxLines: 4,
                      maxLength: 100,
                      controller: feedbackController,
                      decoration: InputDecoration(
                          hintText: "Type your feedback",
                          labelStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.shade200, width: 2),
                              borderRadius: BorderRadius.circular(10)),
                          floatingLabelStyle: const TextStyle(
                              color: Color(0xffFF6663), fontSize: 18),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xffFF6663), width: 1.5),
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    context: context,
                    transitionAnimationDuration:
                        const Duration(milliseconds: 400),
                    dialogType: DialogType.warning,
                    animType: AnimType.scale,
                    btnCancelOnPress: () {},
                    btnOkOnPress: () async {
                      await ref
                          .read(visitorServiceProvider)
                          .visitorreview(
                            visitorid,
                            feedbackController.text.trim(),
                          )
                          .catchError((e, st) {});
                    },
                    btnOkText: "Submit",
                  ).show(),
                  child: SizedBox(
                    width: Responsive.width(context) * 0.28,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.refresh_outlined,
                          color: Color.fromARGB(255, 31, 118, 142),
                          size: 19,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          "Feedback",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 31, 118, 142),
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const VerticallyDivider(
                  color: Colors.grey,
                  width: 2,
                ),
                GestureDetector(
                  // ignore: avoid_print
                  onTap: () => AwesomeDialog(
                    body: TextField(
                      maxLength: 4,
                      controller: flatController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Flat Number",
                          labelStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                          prefixIcon: const Icon(
                            Icons.apartment,
                            color: Colors.black,
                            size: 18,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.shade200, width: 2),
                              borderRadius: BorderRadius.circular(10)),
                          floatingLabelStyle: const TextStyle(
                              color: Color(0xffFF6663), fontSize: 18),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xffFF6663), width: 1.5),
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    context: context,
                    transitionAnimationDuration:
                        const Duration(milliseconds: 400),
                    dialogType: DialogType.info,
                    animType: AnimType.scale,
                    btnCancelOnPress: () {},
                    btnCancelText: "No",
                    btnOkOnPress: () async {
                      await ref
                          .read(visitorServiceProvider)
                          .updatevisitorFlat(
                              visitorsoccode,
                              visitorType,
                              visitorTypeDetail,
                              visitorName,
                              visitormobile,
                              flatController.text.trim(),
                              visitorImage,
                              visitorEnterDate,
                              visitorEnterTime,
                              "ok",
                              "ok",
                              visitorApproveBy,
                              visitorStatus,
                              visitorReview,
                              visitorid)
                          .catchError((e, st) {});
                      await FlutterTts().setLanguage("en-Us");
                      await FlutterTts().setVolume(1.0);
                      await FlutterTts().setSpeechRate(0.5);
                      await FlutterTts().setPitch(1.0);
                      await FlutterTts().speak("Visitor Updated Succesfully");
                    },
                    btnOkText: "Yes",
                  ).show(),
                  child: SizedBox(
                    width: Responsive.width(context) * 0.28,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.apartment,
                          color: Colors.green,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          "Update Flat",
                          style: TextStyle(
                            fontSize: 12,
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
                  width: 2,
                  color: Colors.grey,
                ),
                GestureDetector(
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
                  child: SizedBox(
                    width: Responsive.width(context) * 0.28,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          color: Colors.red,
                          Icons.call,
                          size: 19,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          "Call",
                          style: TextStyle(
                            fontSize: 13,
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
