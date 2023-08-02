import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class VisitorIn extends StatefulWidget {
  @override
  State<VisitorIn> createState() => _VisitorInState();
}

class _VisitorInState extends State<VisitorIn> {
  String? _imagePath;
  Future<void> _addImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    print(image?.path);
    setState(() {
      _imagePath = image?.path;
    });
    // Fluttertoast.showToast(
    //     msg: "Image updated",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.red,
    //     textColor: Colors.white,
    //     fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Visitor-In"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _imagePath == null
              ? const Text('No image')
              : Image.file(File(_imagePath!)),
          const SizedBox(height: 16),
          Text(_imagePath?.split('/').last ?? 'No file'),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _addImage,
        child: const Icon(Icons.image),
      ),
    );
  }
}
