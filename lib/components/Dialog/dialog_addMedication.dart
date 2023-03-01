import 'package:flutter/material.dart';
import 'package:flutter_application/page/medication/home_medication.dart';

import '../../page/medication/medication1.dart';

Future<void> addMedicationlDialog(
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
                onPressed: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: ((context) => const Medication1()))),
                child: const Text('ตกลง'),
              ),
            ],
          )));
}
