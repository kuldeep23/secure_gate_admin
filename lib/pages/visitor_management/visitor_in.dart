import 'dart:convert';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:secure_gates_admin/pages/auth_exception_handler.dart';
import 'package:secure_gates_admin/pages/visitor_management/widget/vertical_divider_widget.dart';
import 'package:secure_gates_admin/utils/pick_new_image.dart';
import 'package:secure_gates_admin/widgets/rounded_button.dart';
import 'package:secure_gates_admin/widgets/rounded_text_field.dart';
import 'package:secure_gates_admin/widgets/rouned_square_button.dart';

import '../../entities/visitor.dart';

final visitorType = [
  "Delivery",
  "Cab",
  "Guest",
  "Services",
  "Parcel",
  "Others",
];
final deliveryDetailsType = [
  "FedEx",
  "ShipRocket",
  "Zomato",
  "Delhivery",
  "Swiggy",
  "Others",
];

class VisitorIn extends HookConsumerWidget {
  const VisitorIn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageBaseCode = useState("");
    final size = MediaQuery.of(context).size;
    final nameTextController = useTextEditingController();
    final mobileTextController = useTextEditingController();
    final flatNumberTextController = useTextEditingController();
    final visitorTypeValue = useState(visitorType[0]);
    final deliveryDetailsTypeValue = useState(deliveryDetailsType[1]);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Visitor-In"),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey
                            .withOpacity(0.6), // Slightly darker shadow color
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: const Offset(
                            0, 5), // Offset in (dx, dy) from top-left
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Text(
                          "MAIN GATE ENTRY",
                          style: TextStyle(fontSize: 35),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        RoundedSquareButton(
                            icon: imageBaseCode.value.isNotEmpty
                                ? ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                        20,
                                      ),
                                    ),
                                    child: Image.memory(
                                      base64.decode(imageBaseCode.value),
                                      height: 120,
                                      width: 120,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : const Icon(
                                    Icons.image,
                                    size: 50,
                                  ),
                            onPress: () async {
                              if (!Platform.isIOS) {
                                final pickedFile = await pickNewImage(false);

                                final pickedImageInBytes =
                                    await pickedFile.readAsBytes();

                                imageBaseCode.value =
                                    base64.encode(pickedImageInBytes);
                              } else {
                                Fluttertoast.showToast(
                                    msg: "This is a simulator",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    fontSize: 16.0);
                              }
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Fill the details:",
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        RoundedInputField(
                          hintText: "Visitor Name",
                          isMobile: false,
                          leadingIcon: Iconsax.user,
                          fieldController: nameTextController,
                        ),
                        InputDecorator(
                          decoration: InputDecoration(
                              labelText: "Visitor Type",
                              labelStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                              prefixIcon: const Icon(
                                Iconsax.user,
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
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                                value: visitorTypeValue.value,
                                elevation: 8,
                                isDense: true,
                                items: visitorType.map((e) {
                                  return DropdownMenuItem<String>(
                                    value: e,
                                    child: Text(e),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  //_valud = value as int;
                                  visitorTypeValue.value = value!;
                                }),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Visibility(
                          visible: visitorTypeValue.value == "Delivery",
                          child: InputDecorator(
                            decoration: InputDecoration(
                                labelText: "Visitor Detail",
                                labelStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                                prefixIcon: const Icon(
                                  Iconsax.user,
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
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                  value: deliveryDetailsTypeValue.value,
                                  elevation: 8,
                                  isDense: true,
                                  items: deliveryDetailsType.map((e) {
                                    return DropdownMenuItem<String>(
                                      value: e,
                                      child: Text(e),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    //_valud = value as int;
                                    deliveryDetailsTypeValue.value = value!;
                                  }),
                            ),
                          ),
                        ),
                        RoundedInputField(
                          hintText: "Mobile Number",
                          isMobile: true,
                          leadingIcon: Icons.phone_outlined,
                          fieldController: mobileTextController,
                        ),
                        RoundedInputField(
                          hintText: "Flat Number",
                          leadingIcon: Iconsax.building,
                          isMobile: false,
                          fieldController: flatNumberTextController,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: RoundedButton(
                                onPress: () async {
                                  EasyLoading.show();
                                  if (imageBaseCode.value.isNotEmpty) {
                                    try {
                                      final formData = FormData.fromMap({
                                        "Visitor_Type": visitorTypeValue.value,
                                        "Visitor_Name":
                                            nameTextController.text.trim(),
                                        "Visitor_Mobile":
                                            mobileTextController.text.trim(),
                                        "Visitor_Flat_No":
                                            flatNumberTextController.text
                                                .trim(),
                                        "Visitor_Approve_By": "Guard",
                                        "Visitor_Type_Detail":
                                            deliveryDetailsTypeValue.value,
                                        "Visitor_Status": 1,
                                        "Guard_Name": "Sanjay",
                                        "Visitor_Image": imageBaseCode.value,
                                      });
                                      final Dio dio = Dio();
                                      final userResponse = await dio.post(
                                        "https://gatesadmin.000webhostapp.com/visitor_enter_result.php",
                                        data: formData,
                                      );
                                      //  print(userResponse.data["status"]);
                                      if (userResponse.data["status"] == "1") {
                                        EasyLoading.dismiss();
                                        final flatMateData =
                                            userResponse.data["User-data"][0];

                                        final responseVisitor = Visitor.fromMap(
                                            userResponse.data["Visitor-data"]
                                                [0]);

                                        if (flatMateData[
                                                "Is_Notification_Active"] ==
                                            "1") {
                                          print(responseVisitor);
                                          // timerDialog(context);

                                          // ignore: use_build_context_synchronously
                                          quickDialogue(
                                            callBack: () {},
                                            subtitle: flatMateData[
                                                "Owner_First_Name"],
                                            ownerName: flatMateData[
                                                "Owner_First_Name"],
                                            imageUrl:
                                                flatMateData["Owner_Image"],
                                            userNo:
                                                flatMateData["Contact_Number"],
                                            visitormobile: flatMateData[
                                                "Owner_First_Name"],
                                            // ignore: use_build_context_synchronously
                                            context: context,
                                            token: flatMateData["FB_Id"],
                                            visitor: responseVisitor,
                                            flatBlock:
                                                flatMateData["Flat_Block"],
                                            ownerType:
                                                flatMateData["Owner_Tenant"],
                                            visitorTypeDetail:
                                                visitorTypeValue.value ==
                                                        "Delivery"
                                                    ? flatMateData[
                                                        "Owner_First_Name"]
                                                    : "...",
                                            flatNo: flatMateData["Flat_Number"],
                                          );
                                        } else {
                                          Fluttertoast.showToast(
                                            msg:
                                                "Visitor Entered without auth !!!",
                                            toastLength: Toast.LENGTH_LONG,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            textColor: Colors.white,
                                            backgroundColor: Colors.red,
                                            fontSize: 17,
                                          );
                                        }
                                      } else if (userResponse.data["status"] ==
                                          "0") {
                                        EasyLoading.dismiss();
                                        Fluttertoast.showToast(
                                            msg: "Visitor Enter faied !!!",
                                            toastLength: Toast.LENGTH_LONG,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIosWeb: 1,
                                            textColor: Colors.white,
                                            backgroundColor: Colors.red,
                                            fontSize: 30.0);
                                        return ErrorHandlers.errorDialog(
                                            userResponse.data["status"]);
                                      }
                                    } catch (e) {
                                      throw ErrorHandlers.errorDialog(e);
                                    }
                                  } else {
                                    EasyLoading.dismiss();
                                    Fluttertoast.showToast(
                                        msg: "Please capture the image first",
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        textColor: Colors.white,
                                        backgroundColor: Colors.red,
                                        fontSize: 15);
                                  }
                                },
                                buttonText: "Submit",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // imagePath.value.isEmpty
            //     ? const Text('No image')
            //     : Image.file(File(imagePath.value)),
            // const SizedBox(height: 16),
            // Text(imagePath.value.split('/').last.isEmpty
            //     ? 'No file'
            //     : imagePath.value.split('/').last),
          ],
        ),
      ),
    );
  }
}

void quickDialogue({
  Color dialogueThemeColor = const Color(0xffFF6663),
  required void Function() callBack,
  String discardTitle = 'Cancel',
  String submitTitle = 'Okay',
  required String subtitle,
  bool onlyShow = false,
  required Visitor visitor,
  required String ownerName,
  required BuildContext context,
  required String imageUrl,
  required String token,
  required String visitormobile,
  required String flatBlock,
  required String ownerType,
  required String visitorTypeDetail,
  required String userNo,
  required String flatNo,
}) {
  showGeneralDialog(
      transitionDuration: const Duration(milliseconds: 400),
      barrierDismissible: true,
      barrierLabel: "Heyyy",
      barrierColor: Colors.black.withOpacity(0.85),
      context: context,
      pageBuilder: (context, anime1, anime2) {
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
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 25,
                            ),
                            Text(
                              "Flat Owner Details",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                          ],
                        ),
                      ),
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                        child: Image.network(
                          imageUrl,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
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
                          ownerName,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Column(
                      children: [
                        Text(
                          userNo,
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
                            flatNo,
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
                          const Icon(
                            Icons.person_outline,
                            size: 15,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(ownerType,
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
                          Text(flatBlock,
                              style: const TextStyle(
                                fontSize: 16,
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              AwesomeDialog(
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
                                  FlutterPhoneDirectCaller.callNumber(
                                      '+91$visitormobile');
                                },
                                btnOkText: "Yes",
                              ).show();
                              // timerDialog(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: const BoxDecoration(
                                color: Color(0xffFF6663),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                ),
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
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                  size: 26,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const VerticallyDivider(),
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              EasyLoading.show();
                              final data = {
                                "fb_ids": [token],
                                "fcm_payload": {
                                  "message": {
                                    "token": token,
                                    "data": {
                                      "name": visitor.visitorName,
                                      "image": visitor.visitorImage,
                                      "title": "NOTIFICATION ALERT",
                                      "body": "Visitor Confirmation",
                                      "id": visitor.visitorId,
                                      "soc_code": visitor.socCode,
                                      "visitor_type_detail":
                                          visitor.visitorTypeDetail,
                                      "visitor_type": visitor.visitorType,
                                      "visitor_mobile": visitor.visitorMobile,
                                      "visitor_flat_no": visitor.visitorFlatNo,
                                    },
                                  },
                                },
                              };
                              final response = await Dio().post(
                                "https://te724vu3fz4hwt23vnl4koewhy0pvxxo.lambda-url.ap-south-1.on.aws/",
                                data: data,
                              );

                              EasyLoading.dismiss();
                              if (context.mounted) {
                                timerDialog(context: context, visitor: visitor);
                              }

                              print(response.data["eventData"]);
                            },
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
                                  bottomRight: Radius.circular(
                                    20,
                                  ),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  "Notify User",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}

void timerDialog({required BuildContext context, required Visitor visitor}) {
  showGeneralDialog(
      transitionDuration: const Duration(milliseconds: 400),
      // barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.65),
      context: context,
      pageBuilder: (context, animation1, animation2) {
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
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Wait for the user to allow the visitor",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      CircularCountDownTimer(
                        duration: 15,
                        initialDuration: 0,
                        controller: CountDownController(),
                        width: MediaQuery.of(context).size.width / 2.6,
                        height: MediaQuery.of(context).size.height / 2.6,
                        ringColor: Colors.grey[300]!,
                        ringGradient: null,
                        fillColor: Colors.redAccent[100]!,
                        fillGradient: null,
                        backgroundColor: Colors.redAccent,
                        backgroundGradient: null,
                        strokeWidth: 20.0,
                        strokeCap: StrokeCap.round,
                        textStyle: const TextStyle(
                            fontSize: 33.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        textFormat: CountdownTextFormat.S,
                        isReverse: false,
                        isReverseAnimation: false,
                        isTimerTextShown: true,
                        autoStart: true,
                        onStart: () {
                          debugPrint('Countdown Started');
                        },
                        onComplete: () async {
                          context.pop();
                          EasyLoading.show();

                          final data = FormData.fromMap({
                            "visitor_id": visitor.visitorId,
                            "soc_code": visitor.socCode,
                          });
                          final Dio dio = Dio();
                          final response = await dio.post(
                            "https://gatesadmin.000webhostapp.com/visitor_approval_status.php",
                            data: data,
                          );
                          EasyLoading.dismiss();
                          final visitorAfterVerification =
                              response.data["data"][0];
                          if (visitorAfterVerification[
                                  "visitor_approve_reject"] ==
                              "NA") {
                            Fluttertoast.showToast(
                                msg: "User Didn't Respond ",
                                toastLength: Toast.LENGTH_LONG);
                          }
                          Fluttertoast.showToast(
                              msg:
                                  "User ${visitorAfterVerification["visitor_approve_reject"]}",
                              toastLength: Toast.LENGTH_LONG);

                          if (context.mounted) {
                            context.pop();
                          }
                        },
                        onChange: (String timeStamp) {
                          debugPrint('Countdown Changed $timeStamp');
                        },
                        timeFormatterFunction:
                            (defaultFormatterFunction, duration) {
                          if (duration.inSeconds == 0) {
                            return "Wait..";
                          } else {
                            return Function.apply(
                                defaultFormatterFunction, [duration]);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      });
}
