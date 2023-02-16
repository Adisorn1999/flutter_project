import 'package:flutter/material.dart';

Future<void> dialogCode400(
    BuildContext context, String title, String message) async {
  showDialog(
      context: context,
      builder: ((context) => AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          )));
}
