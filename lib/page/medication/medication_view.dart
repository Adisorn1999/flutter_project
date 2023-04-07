import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../API/api_provider.dart';
import '../../model/MedicationUserModel.dart';

class MedicationVeiw extends StatefulWidget {
  const MedicationVeiw({super.key});

  @override
  State<MedicationVeiw> createState() => _MedicationVeiwState();
}

class _MedicationVeiwState extends State<MedicationVeiw> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getMedcationByMedcationId();
  }

  Apiprovider apiprovider = Apiprovider();
  var formatter = DateFormat.yMd();
  MedicationUserModel? medicationUserModel;
  var jsonResponse = [];
  Future<MedicationUserModel?> getMedcationByMedcationId() async {
    final prefs = await SharedPreferences.getInstance();
    final int? user_id = prefs.getInt('userId');
    final int? medicationId = prefs.getInt('medicationId');

    var response =
        await apiprovider.getMedcationByMedcationId(user_id!, medicationId!);
    if (response.statusCode == 200) {
      print(response.body);
      jsonResponse = jsonDecode(response.body);
      medicationUserModel = MedicationUserModel.fromJson(jsonResponse[0]);
    }
    return medicationUserModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ข้อมูลยา"),
      ),
      body: FutureBuilder(
          future: getMedcationByMedcationId(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Text("ชื่อยา : ${snapshot.data.medicationName ?? "..."}"),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                          "ปริมาณยา : ${snapshot.data.medicationAmount ?? "..."}"),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                          "เวลาที่ใช้ยา : ${snapshot.data.medicationTime ?? "..."}"),
                      const SizedBox(
                        height: 20,
                      ),
                      // ignore: unnecessary_string_interpolations
                      Text(
                          "วันที่เพิ่มยา : ${formatter.format(snapshot.data.time ?? "...")}"),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("หมายเหตุ : ${snapshot.data.note ?? "..."}"),
                    ],
                  ),
                ),
              );
            }
            return const LinearProgressIndicator();
          }),
    );
  }
}
