import 'package:flutter/material.dart';
import 'package:flutter_application/page/login.dart';

Future<void> registerlDialog(
    BuildContext context, String title, String message) async {
  showDialog(
      context: context,
      builder: ((context) => AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => const LoginPage()))),
                child: const Text('ตกลง'),
              ),
            ],
          )));
}
