import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:secure_gates_admin/pages/auth_exception_handler.dart';
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
    final nameTextController = useTextEditingController();
    final mobileTextController = useTextEditingController();
    final flatNumberTextController = useTextEditingController();

    print("$ownerTenant $ownerFirstName $ownerLastName");

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
                          controller: nameTextController,
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
                          controller: nameTextController,
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
                          controller: nameTextController,
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
                                controller: nameTextController,
                                keyboardType: TextInputType.number,
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
                                controller: nameTextController,
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
                                controller: nameTextController,
                                keyboardType: TextInputType.number,
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
                                controller: nameTextController,
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
                          controller: nameTextController,
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
                                controller: nameTextController,
                                keyboardType: TextInputType.number,
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
                                controller: nameTextController,
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
                          controller: nameTextController,
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
                                controller: nameTextController,
                                keyboardType: TextInputType.number,
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
                                controller: nameTextController,
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
                                controller: nameTextController,
                                keyboardType: TextInputType.number,
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
                                controller: nameTextController,
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
                                controller: nameTextController,
                                keyboardType: TextInputType.number,
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
                                controller: nameTextController,
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
                                controller: nameTextController,
                                keyboardType: TextInputType.number,
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
                                controller: nameTextController,
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
                                      "Visitor_Type": "Guest",
                                      "Visitor_Name":
                                          nameTextController.text.trim(),
                                      "Visitor_Mobile":
                                          mobileTextController.text.trim(),
                                      "Visitor_Flat_No":
                                          flatNumberTextController.text.trim(),
                                      "Visitor_Image":
                                          "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"
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
                                      await FlutterTts()
                                          .speak("Visitor Enter Successfully");
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
