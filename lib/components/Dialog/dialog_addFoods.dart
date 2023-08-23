import 'package:flutter/material.dart';

import '../../page/food/addFood.dart';

Future<void> addFoodslDialog(
    BuildContext context, String title, String message) async {
  showDialog(
      context: context,
      builder: ((context) => AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: ((context) => AddFood()))),
                child: const Text('ตกลง'),
              ),
            ],
          )));
}
