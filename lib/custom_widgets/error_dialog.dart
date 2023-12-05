import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ErrorDialog extends StatefulWidget {
  ErrorDialog({super.key, required this.message, required this.callBack});
  String message;
  Function callBack;
  @override
  State<ErrorDialog> createState() => _ErrorDialogState();
}

class _ErrorDialogState extends State<ErrorDialog> {
  // bool delete=false;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Please Confirm'),
      content: Text(widget.message),
      actions: [
        // The "Yes" button
        TextButton(
            onPressed: () {
              // Remove the box
              setState(() {
                widget.callBack();
              });

              // Close the dialog
              Navigator.of(context).pop();
            },
            child: const Text('Yes')),
        TextButton(
            onPressed: () {
              // Close the dialog
              Navigator.of(context).pop();
            },
            child: const Text('No'))
      ],
    );
  }
}
