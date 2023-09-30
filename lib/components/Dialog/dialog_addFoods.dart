import 'package:flutter/material.dart';

import '../../page/food/addFood.dart';
import '../../page/food/addfoodTest.dart';

Future<void> addFoodslDialog(
    BuildContext context, String title, String message) async {
  showDialog(
      context: context,
      builder: ((context) => AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                child: const Text('สำเร็จ'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: ((context) => const AddFood())));
                },
              ),
            ],
          )));
}
