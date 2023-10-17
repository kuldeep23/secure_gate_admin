import 'dart:convert';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:secure_gates_admin/pages/auth_exception_handler.dart';
import 'package:secure_gates_admin/utils/pick_new_image.dart';
import 'package:secure_gates_admin/widgets/rounded_button.dart';
import 'package:secure_gates_admin/widgets/rounded_text_field.dart';
import 'package:secure_gates_admin/widgets/rouned_square_button.dart';

class VisitorIn extends HookConsumerWidget {
  const VisitorIn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageBaseCode = useState("");
    final size = MediaQuery.of(context).size;
    final nameTextController = useTextEditingController();
    final mobileTextController = useTextEditingController();
    final flatNumberTextController = useTextEditingController();

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
                                        "Visitor_Type": "Guest",
                                        "Visitor_Name":
                                            nameTextController.text.trim(),
                                        "Visitor_Mobile":
                                            mobileTextController.text.trim(),
                                        "Visitor_Flat_No":
                                            flatNumberTextController.text
                                                .trim(),
                                        "Visitor_Image": imageBaseCode.value,
                                      });
                                      final Dio dio = Dio();
                                      final userResponse = await dio.post(
                                        "https://gatesadmin.000webhostapp.com/jh_visitors.php",
                                        data: formData,
                                      );
                                      if (userResponse.data["status"] == 1) {
                                        await FlutterTts().setLanguage("en-Us");
                                        await FlutterTts().setVolume(1.0);
                                        await FlutterTts().setSpeechRate(0.5);
                                        await FlutterTts().setPitch(1.0);
                                        await FlutterTts().speak(
                                            "Visitor Enter Successfully");
                                        // ignore: use_build_context_synchronously
                                        AwesomeDialog(
                                          context: context,
                                          transitionAnimationDuration:
                                              const Duration(milliseconds: 400),
                                          dialogType: DialogType.question,
                                          animType: AnimType.scale,
                                          title: "Visitor Entered Successfully",
                                          desc:
                                              "Do you want to enter more visitor ?",
                                          btnCancelOnPress: () {
                                            Navigator.of(context).pop();
                                          },
                                          btnCancelText: "No",
                                          btnOkOnPress: () {
                                            nameTextController.clear();
                                            flatNumberTextController.clear();
                                            mobileTextController.clear();
                                          },
                                          btnOkText: "Yes",
                                        ).show();
                                      } else if (userResponse.data["status"] ==
                                          0) {
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
