import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/API/api_provider.dart';
import 'package:flutter_application/components/Dialog/dialog_code200.dart';
import 'package:shared_preferences/shared_preferences.dart';

Apiprovider apiprovider = Apiprovider();
final TextEditingController _ctrlDate = TextEditingController();
final TextEditingController _ctrlNote = TextEditingController();
Future<void> addFoodDatailDialog(
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
                  child: const Text("ตกลง"),
                  onPressed: () async {
                    Navigator.pop(context, 'ok');
                    addFoodDatail();
                    dialogCode200(
                        context, "บันทึกสำเร็จ", "บันทึกรายการอาหารสำเร็จ");
                  }),
            ],
          )));
}

Future<void> addFoodDatail() async {
  final prefs = await SharedPreferences.getInstance();
  final int? user_id = prefs.getInt('userId');
  final int? foodId = prefs.getInt('foodId');

  var response = await apiprovider.foodDetail(foodId!, user_id!);
  // var response = await apiprovider.addFoodDetail1(food_id, calorie, user_id)
  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body);
    if (jsonResponse['ok']) {
      print(response.body);
      // ignore: use_build_context_synchronously
    }
    print("object");
  }
}
