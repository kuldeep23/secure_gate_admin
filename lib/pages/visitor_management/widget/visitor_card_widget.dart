import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:secure_gates_admin/pages/visitor_management/widget/responsive_wrap.dart';
import 'package:secure_gates_admin/pages/visitor_management/widget/vertical_divider_widget.dart';

class VisitorCard extends StatefulWidget {
  const VisitorCard({
    super.key,
    required this.visitorApproveBy,
    required this.visitorEnterTime,
    required this.visitorImage,
    required this.visitorName,
    required this.visitorStatus,
    required this.visitorType,
    required this.visitorEnterDate,
    required this.visitorTypeDetail,
  });

  final String visitorImage,
      visitorName,
      visitorType,
      visitorStatus,
      visitorTypeDetail,
      visitorApproveBy,
      visitorEnterTime,
      visitorEnterDate;

  @override
  State<VisitorCard> createState() => _VisitorCardState();
}

class _VisitorCardState extends State<VisitorCard> {
  final TextEditingController feedbackController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                          radius: 35,
                          backgroundImage: NetworkImage(
                            widget.visitorImage,
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
                                "${widget.visitorTypeDetail}, ${widget.visitorName}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 1,
                                  horizontal: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xff6CB4EE),
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                ),
                                child: Text(
                                  widget.visitorStatus.toUpperCase(),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
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
                              widget.visitorType,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.check_circle_outline,
                                size: 18,
                                color: Colors.grey[600],
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                "Allowed by ${widget.visitorApproveBy}",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                  height: 0.9,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.schedule_outlined,
                                size: 18,
                                color: Colors.grey[600],
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                "Entered at ${widget.visitorEnterTime}",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                  height: 0.9,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_month_outlined,
                                size: 18,
                                color: Colors.grey[600],
                              ),
                              Text(
                                widget.visitorEnterDate,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                  height: 0.9,
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
                      maxLines: 5,
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
                    dialogType: DialogType.warning,
                    animType: AnimType.scale,
                    title: "Feedback",
                    btnCancelOnPress: () {},
                    btnOkOnPress: () {
                      print(feedbackController.text);
                    },
                    btnOkText: "Submit",
                  ).show(),
                  child: SizedBox(
                    width: Responsive.width(context) * 0.28,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.refresh_outlined,
                          size: 19,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          "Give Feedback",
                          style: TextStyle(
                            fontSize: Responsive.getFontSize(12),
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
                  onTap: () => print('Hellooo'),
                  child: SizedBox(
                    width: Responsive.width(context) * 0.28,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const RotatedBox(
                          quarterTurns: 2,
                          child: Icon(
                            Icons.login_outlined,
                            size: 19,
                          ),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          "Out",
                          style: TextStyle(
                            fontSize: Responsive.getFontSize(12),
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
                  onTap: () =>
                      FlutterPhoneDirectCaller.callNumber('+919506078010'),
                  child: SizedBox(
                    width: Responsive.width(context) * 0.28,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.call,
                          size: 19,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          "Call",
                          style: TextStyle(
                            fontSize: Responsive.getFontSize(12),
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
