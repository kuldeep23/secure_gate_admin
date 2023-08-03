import 'package:flutter/material.dart';

class VisitorOut extends StatelessWidget {
  const VisitorOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Visitor-Out"),
        ),
        body: const Center(child: Text('VisitorOut')));
  }
}
