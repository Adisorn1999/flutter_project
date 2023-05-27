import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application/API/api_provider.dart';
import 'package:flutter_application/components/Dialog/dialog_code200.dart';
import 'package:flutter_application/page/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

import '../../components/Dialog/dialog_addMedication.dart';
import '../../model/medicationModel.dart';
import 'medication_edit.dart';
import 'medication_view.dart';

enum _MenuValues { settings, page, delete }

class HomeMedication extends StatefulWidget {
  const HomeMedication({super.key});

  @override
  State<HomeMedication> createState() => _HomeMedicationState();
}

class _HomeMedicationState extends State<HomeMedication> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getMedication();
  }

  Apiprovider apiprovider = Apiprovider();
  late List<MedicationModel?> medicationModel;
  var jsonResponse = [];
  bool loading = true;
  late List<MedicationModel?> data = [];
  var formatter = DateFormat.yMd();

  Future<List<MedicationModel?>?> getMedication() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final int? user_id = prefs.getInt('userId');

      var response = await apiprovider.getMedication(user_id!);
      if (response.statusCode == 200) {
        print(response.body);
        // jsonResponse = jsonDecode(response.body);

        medicationModel =
            jsonResponse.map((e) => MedicationModel.fromJson(e)).toList();
        // List<MedicationModel> jsonResponse =
        //     medicationModelFromJson(response.body);
        data = medicationModel;
        loading = false;
      } else {
        throw Exception('Response body is empty.');
      }
    } on Exception catch (e) {
      // TODO
      print(e);
    }
    return data;
  }

  final TextEditingController _ctrlMedicationName = TextEditingController();
  final TextEditingController _ctrlMedicationAmount = TextEditingController();
  final TextEditingController _ctrlMedicationTime = TextEditingController();
  final TextEditingController _ctrlMedicationNote = TextEditingController();

  Future updataMedication() async {
    final prefs = await SharedPreferences.getInstance();
    final int? medicationId = prefs.getInt('medicationId');
    var response = await apiprovider.updatMedication(
        _ctrlMedicationName.text,
        _ctrlMedicationAmount.text,
        _ctrlMedicationTime.text,
        _ctrlMedicationNote.text,
        medicationId!);
    if (response.statusCode == 200) {
      setState(() {
        print(response.body);
        Navigator.of(context).pop();
      });
    }
  }

  // ignore: unused_element
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ชื่อใหม่ของคุณ'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _ctrlMedicationName,
                decoration: const InputDecoration(hintText: "ชื่อยา"),
                autocorrect: false,
              ),
              TextField(
                controller: _ctrlMedicationAmount,
                decoration: const InputDecoration(hintText: "ปริมาณ"),
                autocorrect: false,
              ),
              TextField(
                controller: _ctrlMedicationTime,
                decoration: const InputDecoration(hintText: "เวลาที่ใช้"),
                autocorrect: false,
              ),
              TextField(
                controller: _ctrlMedicationNote,
                decoration: const InputDecoration(hintText: "หมายเหตุ"),
                autocorrect: false,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
                child: const Text('SAVE'), onPressed: () => updataMedication()),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("data"),
        ),
        body: FutureBuilder(
          future: getMedication(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            var x = snapshot.data;
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemCount: x?.length,
                    itemBuilder: ((context, index) {
                      return Card(
                        child: ListTile(
                          title: Wrap(
                            //  crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "ชื่อยา ${x?[index]?.medicationName}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "เวลาใช้ยา ${x?[index]?.medicationTime}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "วันที่เพิ่มยา ${formatter.format(x?[index]?.time)}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                          trailing: PopupMenuButton(
                            itemBuilder: (context) => [
                              const PopupMenuItem(
                                value: _MenuValues.page,
                                child: Text("ดูข้อมูลยา"),
                              ),
                              const PopupMenuItem(
                                value: _MenuValues.settings,
                                child: Text("แก้ไขข้อมูลยา"),
                              ),
                              const PopupMenuItem(
                                value: _MenuValues.delete,
                                child: Text("ลบข้อมูลยา"),
                              )
                            ],
                            onSelected: (value) async {
                              switch (value) {
                                case _MenuValues.page:
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: ((context) =>
                                          const MedicationVeiw())));
                                  final int? medicationId =
                                      x?[index]?.medicationId;
                                  final prefs =
                                      await SharedPreferences.getInstance();
                                  await prefs.setInt(
                                      'medicationId', medicationId!);
                                  break;
                                case _MenuValues.settings:
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //     builder: ((context) =>
                                  //         const MedicationEdit())));
                                  final int? medicationId =
                                      x?[index]?.medicationId;
                                  final prefs =
                                      await SharedPreferences.getInstance();
                                  await prefs.setInt(
                                      'medicationId', medicationId!);

                                  _showDialog(context);

                                  break;
                                case _MenuValues.delete:
                                  deleteMedicationlDialog(
                                      context, "ลบสำเร็จ", "ลบสำเร็จ");
                                  final int? medicationId =
                                      x?[index]?.medicationId;
                                  final prefs =
                                      await SharedPreferences.getInstance();
                                  await prefs.setInt(
                                      'medicationId', medicationId!);
                              }
                            },
                          ),
                          onTap: () async {
                            print("${x?[index]?.medicationId}");
                            print("${x?[index]?.medicationName}");
                            final int? medicationId = x?[index]?.medicationId;
                            final prefs = await SharedPreferences.getInstance();
                            await prefs.setInt('medicationId', medicationId!);
                            // ignore: use_build_context_synchronously
                            addMedicationlDialog(context, "title", "message");
                          },
                          // leading: Icon(Icons.food_bank),
                        ),
                      );
                    }),
                  ))
                ],
              );
            }
            return const LinearProgressIndicator();
          },
        ));
  }

  Future<void> deleteMedicationlDialog(
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
                      setState(() {
                        Navigator.pop(context, 'ok');
                        deleteMedication();
                      });
                    }),
              ],
            )));
  }

  Future<void> deleteMedication() async {
    final prefs = await SharedPreferences.getInstance();
    final int? medicationId = prefs.getInt('medicationId');

    var response = await apiprovider.deleteMedication(medicationId!);
    if (response.statusCode == 200) {
      print(response.body);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('medicationId', medicationId);
    }
  }
}
