import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iconsax/iconsax.dart';
import 'package:secure_gates_admin/utils/pick_new_image.dart';
import 'package:secure_gates_admin/widgets/rounded_button.dart';
import 'package:secure_gates_admin/widgets/rounded_text_field.dart';
import 'package:secure_gates_admin/widgets/rouned_square_button.dart';

class VisitorIn extends HookWidget {
  const VisitorIn({super.key});

  @override
  Widget build(BuildContext context) {
    final imagePath = useState("");
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
                          icon: Icons.image,
                          onPress: () async {
                            if (!Platform.isIOS) {
                              final pickedFile = await pickNewImage(false);
                              imagePath.value = pickedFile.path;
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
                              onPress: () {},
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
