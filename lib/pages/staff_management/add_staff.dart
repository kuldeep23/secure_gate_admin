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
import 'package:http/http.dart' as http;
import '../../controllers/user_controller.dart';
import '../../utils/pick_new_image.dart';
import '../../widgets/rounded_button.dart';
import '../../widgets/rouned_square_button.dart';
import '../auth_exception_handler.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

final staffType = [
  "Maid",
  "Cook",
  "Milkman",
  "Paperboy",
  "Car Cleaner",
  "Dance Teacher",
  "Tution Teacher",
  "Gym Teacher",
  "Plumber",
  "House Cleaning",
  "Grocery Shop",
  "Nurse",
  "Elderly Caretaker",
  "Laundry",
  "Beautician",
  "Flower Delivery",
  "Staff",
  "Interior Worker",
  "Water Supplier",
  "Tailor",
  "Vegetable Vendor",
  "Other",
];

class AddStaff extends HookConsumerWidget {
  const AddStaff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String? dropdownValue;


    getData() async {
      final res = await http.get(Uri.parse(
          "https://gatesadmin.000webhostapp.com/society_details.php"));
    }

    final imageCode = useState("");
    final imageBaseCode = useState("");
    final pickedImage = useState(XFile(""));
    final size = MediaQuery.of(context).size;
    final nameTextController = useTextEditingController();
    final mobileTextController = useTextEditingController();
    final flatNumberTextController = useTextEditingController();
    final staffTypeValue = useState(staffType[0]);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Staff"),
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
                          "Click to add staff",
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
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
                            "Fill the Staff details:",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: nameTextController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: "Staff Name",
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
                        InputDecorator(
                          decoration: InputDecoration(
                              labelText: "Staff Type",
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
                                value: staffTypeValue.value,
                                elevation: 8,
                                isDense: true,
                                items: staffType.map((e) {
                                  return DropdownMenuItem<String>(
                                    value: e,
                                    child: Text(e),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  //_valud = value as int;
                                  staffTypeValue.value = value!;
                                }),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: flatNumberTextController,
                          keyboardType: TextInputType.number,
                          maxLength: 4,
                          decoration: InputDecoration(
                              labelText: "Flat Number",
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
                                    final staffAddedName = ref
                                        .watch(userControllerProvider)
                                        .currentUser!
                                        .ownerFirstName;
                                    try {
                                      final formData = FormData.fromMap({
                                        "soc_code": socCode,
                                        "staff_name":
                                            nameTextController.text.trim(),
                                        "staff_type": staffTypeValue.value,
                                        "staff_flat_no":
                                            flatNumberTextController.text
                                                .trim(),
                                        "staff_icon": imageBaseCode.value,
                                        "staff_mobile_no":
                                            mobileTextController.text.trim(),
                                        "name_added": staffAddedName
                                      });
                                      final Dio dio = Dio();
                                      final userResponse = await dio.post(
                                        "https://gatesadmin.000webhostapp.com/add_staff.php",
                                        data: formData,
                                      );
                                      if (userResponse.data["status"] == 1) {
                                        EasyLoading.dismiss();
                                        await FlutterTts().setLanguage("en-Us");
                                        await FlutterTts().setVolume(1.0);
                                        await FlutterTts().setSpeechRate(0.5);
                                        await FlutterTts().setPitch(1.0);
                                        await FlutterTts()
                                            .speak("Staff Added Successfully");
                                        // ignore: use_build_context_synchronously
                                        AwesomeDialog(
                                          context: context,
                                          transitionAnimationDuration:
                                              const Duration(milliseconds: 400),
                                          dialogType: DialogType.question,
                                          animType: AnimType.scale,
                                          title: "Staff Added Successfully",
                                          desc:
                                              "Do you want to add more staff ?",
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
                                        EasyLoading.dismiss();
                                        Fluttertoast.showToast(
                                            msg: "Staff Added failed !!!",
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
