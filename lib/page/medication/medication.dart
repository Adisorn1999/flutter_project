import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application/API/api_provider.dart';
import 'package:flutter_application/model/medicationMode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class Getmedication extends StatefulWidget {
  const Getmedication({super.key});

  @override
  State<Getmedication> createState() => _GetmedicationState();
}

class _GetmedicationState extends State<Getmedication> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMedication();
  }

  Apiprovider apiprovider = Apiprovider();

  late List<MedicationModel?> medicationModel;

  var jsonResponse = [];
  var formatter = DateFormat.yMd();

  Future<List<MedicationModel?>?> getMedication() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final int? user_id = prefs.getInt('userId');
      var response = await apiprovider.getMedication(user_id!);
      if (response.statusCode == 200) {
        print(response.body);
        jsonResponse = jsonDecode(response.body);
        medicationModel =
            jsonResponse.map((e) => MedicationModel.fromJson(e)).toList();

        // medicationModel = List<MedicationModel>.from(jsonResponse.map(
        //     (medicationModel) => MedicationModel(
        //         medicationId: medicationModel['medication_id'],
        //         medicationName: medicationModel['medication_name'],
        //         medicationAmount: medicationModel['medication_amount'],
        //         medicationTime: medicationModel['medication_time'],
        //         time: DateTime.parse(medicationModel["time"]),
        //         note: medicationModel["note"])));
        jsonResponse = jsonDecode(response.body);
        medicationModel =
            jsonResponse.map((e) => MedicationModel.fromJson(e)).toList();
      }
    } on Exception catch (e) {
      // TODO
      print(e);
    }
    return medicationModel;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("data"),
        ),
        body: FutureBuilder(
          future: getMedication(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SingleChildScrollView(
                child: DataTable(
                  columns: const [
                    // DataColumn(label: Text('ID')),
                    DataColumn(label: Text('name')),
                    // DataColumn(label: Text('amount')),
                    // DataColumn(label: Text('medication')),
                    DataColumn(label: Text('time')),
                    DataColumn(label: Text('note')),
                  ],
                  rows: medicationModel
                      .map((medicationModel) => DataRow(
                            cells: [
                              // DataCell(Text(
                              //     medicationModel!.medicationId.toString())),
                              DataCell(Text(
                                  medicationModel!.medicationName.toString())),
                              // DataCell(Text(
                              //     medicationModel.medicationAmount.toString())),
                              // DataCell(Text(
                              //     medicationModel.medicationTime.toString())),
                              DataCell(Text(
                                formatter.format(medicationModel.time!),
                              )),
                              DataCell(Text(medicationModel.note.toString())),
                            ],
                          ))
                      .toList(),
                ),
              );
            }
            return const LinearProgressIndicator();
          },
        ));
  }
}
