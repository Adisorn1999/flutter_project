import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/API/api_provider.dart';
import 'package:flutter_application/components/Dialog/dialog_code200.dart';
import 'package:flutter_application/page/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

Apiprovider apiprovider = Apiprovider();
Future<void> loginDatailDialog(
    BuildContext context, String title, String message) async {
  showDialog(
      context: context,
      builder: ((context) => AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => const HomePage()))),
                child: const Text('ตกลง'),
              ),
            ],
          )));
}
