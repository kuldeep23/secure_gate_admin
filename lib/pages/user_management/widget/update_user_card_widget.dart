import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:secure_gates_admin/pages/auth_exception_handler.dart';
import 'package:secure_gates_admin/pages/user_management/activate_user.dart';
import 'package:secure_gates_admin/services/user_services.dart';
import 'package:secure_gates_admin/widgets/rounded_button.dart';

class UpdateUserCard extends HookConsumerWidget {
  const UpdateUserCard({
    super.key,
    required this.id,
    required this.ownerTenant,
    required this.ownerFirstName,
    required this.ownerLastName,
    required this.ownerImage,
    required this.flatNumber,
  });

  final String id,
      ownerTenant,
      ownerFirstName,
      ownerLastName,
      ownerImage,
      flatNumber;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email_TextController  = useTextEditingController();
    final dob_TextController = useTextEditingController();
    final homeTownAddress_TextController = useTextEditingController();
    final mobile_TextController = useTextEditingController();
    final member_TextController = useTextEditingController();
    final gender_TextController = useTextEditingController();
    final bloodGroup_TextController = useTextEditingController();
    final profession_TextController = useTextEditingController();
    final professionDetails_TextController  = useTextEditingController();
    final flatBlock_TextController = useTextEditingController();
    final flatfloor_TextController = useTextEditingController();
    final flatType_TextController = useTextEditingController();
    final parkingType_TextController = useTextEditingController();
    final parkingNumber_TextController = useTextEditingController();
    final petType_TextController = useTextEditingController();
    final petName_TextController = useTextEditingController();
    final twowheeletype_TextController = useTextEditingController();
    final twowheelernumber_TextController = useTextEditingController();
    final fourwheelerbrand_TextController = useTextEditingController();
    final fourwheelernumber_TextController = useTextEditingController();


    final imagePath = useState("");
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Activate User",
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
                padding: const EdgeInsets.all(7),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(
                            ownerImage,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
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
                            ownerTenant,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.apartment,
                              size: 16,
                              color: Colors.grey[600],
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              "$flatNumber, $ownerFirstName $ownerLastName",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                                height: 1.2,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.symmetric(
                              horizontal: 30),
                          child: Divider(
                            color: Colors.grey[400],
                            thickness: 0.50,
                          ),
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "User Information",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: email_TextController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                              prefixIcon: const Icon(
                                Icons.email,
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
                        TextField(
                          controller: dob_TextController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: "Date of Birth",
                              labelStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                              prefixIcon: const Icon(
                                Icons.date_range,
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
                          height: 8,
                        ),
                        TextField(
                          controller: homeTownAddress_TextController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: "Home Town Address",
                              labelStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                              prefixIcon: const Icon(
                                Icons.contact_mail,
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
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              child: TextField(
                                controller: member_TextController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    labelText: "Member",
                                    labelStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                    prefixIcon: const Icon(
                                      Icons.group,
                                      color: Colors.black,
                                      size: 18,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 10),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade200,
                                            width: 2),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    floatingLabelStyle: const TextStyle(
                                        color: Color(0xffFF6663), fontSize: 18),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xffFF6663),
                                            width: 1.5),
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              child: TextField(
                                controller: gender_TextController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    labelText: "Gender",
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
                                            color: Colors.grey.shade200,
                                            width: 2),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    floatingLabelStyle: const TextStyle(
                                        color: Color(0xffFF6663), fontSize: 18),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xffFF6663),
                                            width: 1.5),
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              child: TextField(
                                controller: bloodGroup_TextController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    labelText: "Blood Group",
                                    labelStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                    prefixIcon: const Icon(
                                      Icons.bloodtype,
                                      color: Colors.black,
                                      size: 18,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 10),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade200,
                                            width: 2),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    floatingLabelStyle: const TextStyle(
                                        color: Color(0xffFF6663), fontSize: 18),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xffFF6663),
                                            width: 1.5),
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              child: TextField(
                                controller: profession_TextController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    labelText: "Profession",
                                    labelStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                    prefixIcon: const Icon(
                                      Icons.work,
                                      color: Colors.black,
                                      size: 18,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 10),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade200,
                                            width: 2),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    floatingLabelStyle: const TextStyle(
                                        color: Color(0xffFF6663), fontSize: 18),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xffFF6663),
                                            width: 1.5),
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextField(
                          controller: professionDetails_TextController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: "Profession Details",
                              labelStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                              prefixIcon: const Icon(
                                Icons.work_outline,
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
                          height: 20,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Flat Information",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              child: TextField(
                                controller: flatBlock_TextController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    labelText: "Flat Block",
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
                                            color: Colors.grey.shade200,
                                            width: 2),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    floatingLabelStyle: const TextStyle(
                                        color: Color(0xffFF6663), fontSize: 18),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xffFF6663),
                                            width: 1.5),
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              child: TextField(
                                controller: flatfloor_TextController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    labelText: "Flat Floor",
                                    labelStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                    prefixIcon: const Icon(
                                      Icons.home,
                                      color: Colors.black,
                                      size: 18,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 10),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade200,
                                            width: 2),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    floatingLabelStyle: const TextStyle(
                                        color: Color(0xffFF6663), fontSize: 18),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xffFF6663),
                                            width: 1.5),
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: flatType_TextController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: "Flat Type",
                              labelStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                              prefixIcon: const Icon(
                                Icons.other_houses,
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
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              child: TextField(
                                controller: parkingType_TextController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    labelText: "Parking Type",
                                    labelStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                    prefixIcon: const Icon(
                                      Icons.local_parking,
                                      color: Colors.black,
                                      size: 18,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 10),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade200,
                                            width: 2),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    floatingLabelStyle: const TextStyle(
                                        color: Color(0xffFF6663), fontSize: 18),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xffFF6663),
                                            width: 1.5),
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              child: TextField(
                                controller: parkingNumber_TextController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    labelText: "Parking Number",
                                    labelStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                    prefixIcon: const Icon(
                                      Icons.local_parking,
                                      color: Colors.black,
                                      size: 18,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 10),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade200,
                                            width: 2),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    floatingLabelStyle: const TextStyle(
                                        color: Color(0xffFF6663), fontSize: 18),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xffFF6663),
                                            width: 1.5),
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              child: TextField(
                                controller: petType_TextController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    labelText: "Pet Type",
                                    labelStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                    prefixIcon: const Icon(
                                      Icons.pets,
                                      color: Colors.black,
                                      size: 18,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 10),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade200,
                                            width: 2),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    floatingLabelStyle: const TextStyle(
                                        color: Color(0xffFF6663), fontSize: 18),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xffFF6663),
                                            width: 1.5),
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              child: TextField(
                                controller: petName_TextController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    labelText: "Pet Name",
                                    labelStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                    prefixIcon: const Icon(
                                      Icons.pets,
                                      color: Colors.black,
                                      size: 18,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 10),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade200,
                                            width: 2),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    floatingLabelStyle: const TextStyle(
                                        color: Color(0xffFF6663), fontSize: 18),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xffFF6663),
                                            width: 1.5),
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Vehicle Information",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              child: TextField(
                                controller: twowheeletype_TextController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    labelText: "2 Wheeler Type",
                                    labelStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                    prefixIcon: const Icon(
                                      Icons.two_wheeler,
                                      color: Colors.black,
                                      size: 18,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 10),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade200,
                                            width: 2),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    floatingLabelStyle: const TextStyle(
                                        color: Color(0xffFF6663), fontSize: 18),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xffFF6663),
                                            width: 1.5),
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              child: TextField(
                                controller: twowheelernumber_TextController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    labelText: "2 Wheeler No.",
                                    labelStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                    prefixIcon: const Icon(
                                      Icons.two_wheeler,
                                      color: Colors.black,
                                      size: 18,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 10),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade200,
                                            width: 2),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    floatingLabelStyle: const TextStyle(
                                        color: Color(0xffFF6663), fontSize: 18),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xffFF6663),
                                            width: 1.5),
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              child: TextField(
                                controller: fourwheelerbrand_TextController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    labelText: "4 Wheeler Brand",
                                    labelStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                    prefixIcon: const Icon(
                                      Icons.directions_car,
                                      color: Colors.black,
                                      size: 18,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 10),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade200,
                                            width: 2),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    floatingLabelStyle: const TextStyle(
                                        color: Color(0xffFF6663), fontSize: 18),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xffFF6663),
                                            width: 1.5),
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              child: TextField(
                                controller: fourwheelernumber_TextController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    labelText: "4 Wheeler No.",
                                    labelStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                    prefixIcon: const Icon(
                                      Icons.directions_car,
                                      color: Colors.black,
                                      size: 16,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 10),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade200,
                                            width: 2),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    floatingLabelStyle: const TextStyle(
                                        color: Color(0xffFF6663), fontSize: 18),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xffFF6663),
                                            width: 1.5),
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: RoundedButton(
                                onPress: () async {
                                  try {
                                    final formData = FormData.fromMap({
                                      "UID": id, 
                                      "Owner_Tenant": "Tenant", 
                                      "Email": email_TextController.text.trim(),
                                      "DOB": dob_TextController..text.trim(), 
                                      "HomeTown_Address": homeTownAddress_TextController.text.trim(), 
                                      "Member": member_TextController.text.trim(),
                                      "Gender": gender_TextController.text.trim(), 
                                      "Blood_Group": bloodGroup_TextController.text.trim(), 
                                      "Profession": profession_TextController.text.trim(),
                                      "Profession_Details": professionDetails_TextController.text.trim(), 
                                      "Flat_Block": flatBlock_TextController.text.trim(), 
                                      "Flat_Floor": flatfloor_TextController.text.trim(),
                                      "Flat_Type": flatType_TextController.text.trim(), 
                                      "Parking_Type": parkingType_TextController.text.trim(), 
                                      "Parking_Number": parkingNumber_TextController.text.trim(),
                                      "Pet_Type": petType_TextController.text.trim(),
                                      "Pet_Name": petName_TextController.text.trim(), 
                                      "Two_Wheeler_Type": twowheeletype_TextController.text.trim(), 
                                      "Two_Wheeler_Number": twowheelernumber_TextController.text.trim(),
                                      "Four_Wheeler_Brand": fourwheelerbrand_TextController.text.trim(), 
                                      "Four_Wheeler_Number": fourwheelernumber_TextController.text.trim() 
                                                                          
                                    });
                                    final Dio dio = Dio();
                                    final userResponse = await dio.post(
                                      "https://gatesadmin.000webhostapp.com/update_flat_user.php",
                                      data: formData,
                                    );
                                    if (userResponse.data["status"] == 1) {
                                      await FlutterTts().setLanguage("en-Us");
                                      await FlutterTts().setVolume(1.0);
                                      await FlutterTts().setSpeechRate(0.5);
                                      await FlutterTts().setPitch(1.0);
                                      await FlutterTts()
                                          .speak("User Acitivated Successfully");
                                      // ignore: use_build_context_synchronously
                                      AwesomeDialog(
                                        context: context,
                                        transitionAnimationDuration:
                                            const Duration(milliseconds: 400),
                                        dialogType: DialogType.question,
                                        animType: AnimType.scale,
                                        title: "User Acitivated Successfully",
                                        desc:
                                            "Do you want to activate more users ?",
                                        btnCancelOnPress: () {
                                          Navigator.of(context).pop();
                                        },
                                        btnCancelText: "No",
                                        btnOkOnPress: () {
                                         ref.refresh(allSocietyUserDataProvider.future);
                                        },
                                        btnOkText: "Yes",
                                      ).show();
                                    } else if (userResponse.data["status"] ==
                                        0) {
                                      Fluttertoast.showToast(
                                          msg: "User Acitivated failed !!!",
                                          toastLength: Toast.LENGTH_LONG,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          textColor: Colors.white,
                                          backgroundColor: Colors.red,
                                          fontSize: 15.0);
                                      return ErrorHandlers.errorDialog(
                                          userResponse.data["status"]);
                                    }
                                  } catch (e) {
                                    throw ErrorHandlers.errorDialog(e);
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
