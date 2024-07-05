import 'dart:convert';
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:secure_gates_admin/general_providers.dart';
import '../../controllers/user_controller.dart';
import '../../utils/pick_new_image.dart';
import '../../widgets/rounded_button.dart';
import '../../widgets/rouned_square_button.dart';
import '../auth_exception_handler.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

final userRole = [
  "Guard",
  "Plumber",
  "Electrician",
  "Maintenance",
  "Secretary",
  "Other",
];

final gender = ["Male", "Female"];

class AddGuard extends HookConsumerWidget {
  const AddGuard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageBaseCode = useState("");
    final pickedImage = useState(XFile(""));
    final size = MediaQuery.of(context).size;
    final fNameTextController = useTextEditingController();
    final lNameTextController = useTextEditingController();
    final mobileTextController = useTextEditingController();
    final userNameTextController = useTextEditingController();
    final passwordTextController = useTextEditingController();
    final addressTextController = useTextEditingController();
    final dobTextController = useTextEditingController();
    useState(userRole[0]);
    final genderValue = useState(gender[0]);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Guard",
          style: TextStyle(color: Colors.white),
        ),
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
                          "Click Image Button to Add Image",
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
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
                            "Fill the guard details:",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: fNameTextController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: "First Name",
                              labelStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                              prefixIcon: const Icon(
                                Icons.person,
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
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: lNameTextController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: "Last Name",
                              labelStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                              prefixIcon: const Icon(
                                Icons.person,
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
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: mobileTextController,
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          decoration: InputDecoration(
                              labelText: "Mobile Number",
                              labelStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                              prefixIcon: const Icon(
                                Icons.phone,
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
                        /* InputDecorator(
                          decoration: InputDecoration(
                              labelText: "User Role",
                              labelStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
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
                                value: userRoleValue.value,
                                elevation: 8,
                                isDense: true,
                                items: userRole.map((e) {
                                  return DropdownMenuItem<String>(
                                    value: e,
                                    child: Text(e),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  //_valud = value as int;
                                  userRoleValue.value = value!;
                                }),
                          ),
                        ), 
                        const SizedBox(
                          height: 15,
                        ),*/
                        TextField(
                          controller: userNameTextController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: "User Name",
                              labelStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                              prefixIcon: const Icon(
                                Iconsax.building,
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
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: passwordTextController,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                              prefixIcon: const Icon(
                                Iconsax.building,
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
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: addressTextController,
                          keyboardType: TextInputType.streetAddress,
                          decoration: InputDecoration(
                              labelText: "Address",
                              labelStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                              prefixIcon: const Icon(
                                Iconsax.building,
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
                        const SizedBox(
                          height: 15,
                        ),
                        InputDecorator(
                          decoration: InputDecoration(
                              labelText: "Gender",
                              labelStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
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
                                value: genderValue.value,
                                elevation: 8,
                                isDense: true,
                                items: gender.map((e) {
                                  return DropdownMenuItem<String>(
                                    value: e,
                                    child: Text(e),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  //_valudgenderValue= value as int;
                                  genderValue.value = value!;
                                }),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: dobTextController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: "D.O.B.",
                              labelStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                              prefixIcon: const Icon(
                                Iconsax.building,
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
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: RoundedButton(
                                onPress: () async {
                                  if (imageBaseCode.value.isNotEmpty) {
                                    EasyLoading.show();

                                    final socCode = ref
                                        .watch(userControllerProvider)
                                        .currentUser!
                                        .socCode;

                                    final socName = ref
                                        .watch(userControllerProvider)
                                        .currentUser!
                                        .socName;

                                    final addedbyName = ref
                                        .watch(userControllerProvider)
                                        .currentUser!
                                        .userFirstName;

                                    try {
                                      final formData = FormData.fromMap({
                                        "socCode": socCode,
                                        "socName": socName,
                                        "userRole": "Guard",
                                        "userfName":
                                            fNameTextController.text.trim(),
                                        "userlName":
                                            lNameTextController.text.trim(),
                                        "userImage": imageBaseCode.value,
                                        "userNumber":
                                            mobileTextController.text.trim(),
                                        "email":
                                            userNameTextController.text.trim(),
                                        "password":
                                            passwordTextController.text.trim(),
                                        "address":
                                            addressTextController.text.trim(),
                                        "gender": genderValue.value,
                                        "dob": dobTextController.text.trim(),
                                        "addedBy": addedbyName
                                      });
                                      final Dio dio = Dio();
                                      final userResponse = await dio.post(
                                        "${ref.read(generalUrlPathProvider)}/add_admin_user.php",
                                        data: formData,
                                      );

                                      if (userResponse.data["status"] == 1) {
                                        EasyLoading.dismiss();
                                        await FlutterTts().setLanguage("en-Us");
                                        await FlutterTts().setVolume(1.0);
                                        await FlutterTts().setSpeechRate(0.5);
                                        await FlutterTts().setPitch(1.0);
                                        await FlutterTts()
                                            .speak("User Added Successfully");
                                        // ignore: use_build_context_synchronously
                                        AwesomeDialog(
                                          context: context,
                                          transitionAnimationDuration:
                                              const Duration(milliseconds: 400),
                                          dialogType: DialogType.question,
                                          animType: AnimType.scale,
                                          title: "User Added Successfully",
                                          desc:
                                              "Do you want to add more user ?",
                                          btnCancelOnPress: () {
                                            Navigator.of(context).pop();
                                          },
                                          btnCancelText: "No",
                                          btnOkOnPress: () {
                                            fNameTextController.clear();
                                            lNameTextController.clear();
                                            mobileTextController.clear();
                                            userNameTextController.clear();
                                            passwordTextController.clear();
                                            addressTextController.clear();
                                            dobTextController.clear();
                                          },
                                          btnOkText: "Yes",
                                        ).show();
                                      } else if (userResponse.data["status"] ==
                                          0) {
                                        EasyLoading.dismiss();
                                        Fluttertoast.showToast(
                                            msg: "User Added failed !!!",
                                            toastLength: Toast.LENGTH_LONG,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            textColor: Colors.white,
                                            backgroundColor: Colors.red,
                                            fontSize: 15.0);
                                        return ErrorHandlers.errorDialog(
                                            userResponse.data["status"]);
                                      }
                                    } catch (e) {
                                      EasyLoading.dismiss();
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
