import 'dart:convert';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:secure_gates_admin/pages/auth_exception_handler.dart';
import 'package:secure_gates_admin/utils/pick_new_image.dart';
import 'package:secure_gates_admin/widgets/rounded_button.dart';
import 'package:secure_gates_admin/widgets/rounded_text_field.dart';
import 'package:secure_gates_admin/widgets/rouned_square_button.dart';

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
    final pickedImage = useState(XFile(""));
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
                            icon: const Icon(
                              Icons.image,
                              size: 50,
                            ),
                            onPress: () async {
                              if (!Platform.isIOS) {
                                final pickedFile = await pickNewImage(false);
                                pickedImage.value = XFile(pickedFile.path);

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
                          visible: visitorTypeValue.value == "Delivery"
                              ? true
                              : false,
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
                                        final flatMateData =
                                            userResponse.data["User-data"][0];

                                        // ignore: use_build_context_synchronously
                                        quickDialogue(
                                          callBack: () {},
                                          subtitle:
                                              flatMateData["Owner_First_Name"],
                                          ownerName:
                                              flatMateData["Owner_First_Name"],
                                          imageUrl: flatMateData["Owner_Image"],
                                          visitormobile:
                                              flatMateData["Owner_First_Name"],
                                          context: context,
                                          token: flatMateData["FB_Id"],
                                          outTime: flatMateData[
                                                  "Owner_First_Name"] ??
                                              "Still Inside",
                                          outDate: flatMateData[
                                                  "Owner_First_Name"] ??
                                              "Still Inside",
                                          allowedBy:
                                              flatMateData["Owner_First_Name"],
                                          visitorTypeDetail:
                                              flatMateData["Owner_First_Name"],
                                          flatNo:
                                              flatMateData["Owner_First_Name"],
                                        );
                                        // await FlutterTts().setLanguage("en-Us");
                                        // await FlutterTts().setVolume(1.0);
                                        // await FlutterTts().setSpeechRate(0.5);
                                        // await FlutterTts().setPitch(1.0);
                                        // await FlutterTts().speak(
                                        //     "Visitor Enter Successfully");
                                        // ignore: use_build_context_synchronously

                                        // AwesomeDialog(
                                        //   context: context,
                                        //   transitionAnimationDuration:
                                        //       const Duration(milliseconds: 400),
                                        //   dialogType: DialogType.question,
                                        //   animType: AnimType.scale,
                                        //   title: "Visitor Entered Successfully",
                                        //   desc:
                                        //       "Do you want to enter more visitor ?",
                                        //   btnCancelOnPress: () {
                                        //     Navigator.of(context).pop();
                                        //   },
                                        //   btnCancelText: "No",
                                        //   btnOkOnPress: () {
                                        //     nameTextController.clear();
                                        //     flatNumberTextController.clear();
                                        //     mobileTextController.clear();
                                        //   },
                                        //   btnOkText: "Yes",
                                        // ).show();
                                      } else if (userResponse.data["status"] ==
                                          "0") {
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

Future<void> quickDialogue({
  Color dialogueThemeColor = const Color(0xffFF6663),
  required void Function() callBack,
  String discardTitle = 'Cancel',
  String submitTitle = 'Okay',
  required String subtitle,
  bool onlyShow = false,
  required String ownerName,
  required BuildContext context,
  required String imageUrl,
  required String token,
  required String outTime,
  required String visitormobile,
  required String outDate,
  required String allowedBy,
  required String visitorTypeDetail,
  required String flatNo,
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
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
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
                    flatNo,
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      size: 15,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "token",
                      style: TextStyle(
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
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  final data = {
                    "message": {
                      "token": token,
                      "notification": {
                        "title": "NOTIFICATION ALERT",
                        "body": "Visitor Confirmation",
                        "image": imageUrl
                      }
                    }
                  };
                  final response = await Dio().post(
                    "https://te724vu3fz4hwt23vnl4koewhy0pvxxo.lambda-url.ap-south-1.on.aws/",
                    data: data,
                  );

                //  print(response.data["eventData"]);
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
                      bottomLeft: Radius.circular(
                        20,
                      ),
                      bottomRight: Radius.circular(
                        20,
                      ),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Send Notification to Verifiy",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
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
