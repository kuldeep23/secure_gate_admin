import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:http/http.dart' as http;
import '../../widgets/rounded_button.dart';
import '../../widgets/rounded_text_field.dart';
import '../../widgets/rouned_square_button.dart';

class AddStaff extends HookConsumerWidget {
  const AddStaff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List data = [];
    String? dropdownValue;
  

    getData() async {
      final res = await http.get(Uri.parse(
          "https://gatesadmin.000webhostapp.com/society_details.php"));
      data = jsonDecode(res.body);
    }

    //final imagePath = useState("");
    final size = MediaQuery.of(context).size;
    final nameTextController = useTextEditingController();
    final mobileTextController = useTextEditingController();
    final flatNumberTextController = useTextEditingController();

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
                          "Click to add STAFF",
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RoundedSquareButton(
                            icon: Icons.image,
                            onPress: () {
                              getData();
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Fill the Staff details:",
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        InputDecorator(
                          decoration: InputDecoration(
                              labelText: "Select Society",
                              labelStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                              prefixIcon: const Icon(
                                Iconsax.home,
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
                                value: dropdownValue,
                                elevation: 8,
                                isDense: true,
                                items: data.map((e) {
                                  return DropdownMenuItem<String>(
                                    value: e["soc_name"],
                                    child: Text(e["soc_name"]),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  useState(() {
                                    dropdownValue = value.toString();
                                  });
                                }),
                          ),
                        ),
                        RoundedInputField(
                          hintText: "Staff Name",
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
                          hintText: "Add Flat Number",
                          leadingIcon: Iconsax.building,
                          isMobile: false,
                          fieldController: flatNumberTextController,
                        ),
                        RoundedInputField(
                          hintText: "Staff Name",
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
                          hintText: "Add Flat Number",
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
