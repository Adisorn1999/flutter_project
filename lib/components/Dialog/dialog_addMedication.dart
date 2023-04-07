import 'package:flutter/material.dart';

import '../../page/medication/home_medication.dart';
import '../../page/medication/medication_view.dart';

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
                        builder: ((context) => const MedicationVeiw()))),
                child: const Text('ตกลง'),
              ),
            ],
          )));
}
