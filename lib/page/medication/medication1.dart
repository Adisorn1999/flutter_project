import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../API/api_provider.dart';
import '../../API/api_provider_authen.dart';
import '../../model/MedicationUserModel.dart';

class Medication1 extends StatefulWidget {
  const Medication1({super.key});

  @override
  State<Medication1> createState() => _Medication1State();
}

class _Medication1State extends State<Medication1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMedcationByMedcationId();
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
        title: Text(" "),
      ),
      body: FutureBuilder(
          future: getMedcationByMedcationId(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Text("${snapshot.data.medicationName ?? "..."}"),
                    ),
                    Container(
                      child: Text("${snapshot.data.medicationTime ?? "..."}"),
                    ),
                    Container(
                      child: Text(
                          // ignore: unnecessary_string_interpolations
                          "${formatter.format(snapshot.data.time ?? "...")}"),
                    )
                  ],
                ),
              );
            }
            return const LinearProgressIndicator();
          }),
    );
  }
}
