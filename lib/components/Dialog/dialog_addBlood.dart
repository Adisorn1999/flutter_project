import 'package:flutter/material.dart';

import '../../page/blood/ิblood_of_day.dart';
import '../../page/food/addFood.dart';
import '../../page/food/addfoodTest.dart';

Future<void> addBloodDialog(
    BuildContext context, String title, String message) async {
  showDialog(
      context: context,
      builder: ((context) => AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                child: const Text('ยกเลิก'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: ((context) => const BloodOfDay())));
                },
              ),
              TextButton(
                child: const Text('แก้ไข'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: ((context) => const BloodOfDay())));
                },
              ),
            ],
          )));
}
