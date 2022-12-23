import 'package:flutter/material.dart';

import '../../page/login.dart';

Future<void> logoutDialog(
    BuildContext context, String title, String message) async {
  showDialog(
      context: context,
      builder: ((context) => AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('ยกเลิก'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => const LoginPage()))),
                child: const Text('ตกลง'),
              ),
            ],
          )));
}
