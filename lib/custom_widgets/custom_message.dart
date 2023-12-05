import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Message extends StatelessWidget {
  Message(
      {super.key,
      required this.message,
      required this.pos,
      this.title = "Instructions"});
  final String? message;
  String title = "Instructions";
  bool pos = false;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      title: Text(title),
      content: Text(message!),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: pos ? Colors.blue : Colors.red),
          child: const Center(
            child: Text("Ok"),
          ),
        )
      ],
    );
  }
}
