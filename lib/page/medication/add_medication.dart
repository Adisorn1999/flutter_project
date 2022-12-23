import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/API/api_provider.dart';
import 'package:intl/intl.dart';

class AddMedication extends StatefulWidget {
  const AddMedication({super.key});

  @override
  State<AddMedication> createState() => _AddMedicationState();
}

class _AddMedicationState extends State<AddMedication> {
  final TextEditingController _ctrlMedicationName = TextEditingController();
  final TextEditingController _ctrlMedicationAmount = TextEditingController();
  final TextEditingController _ctrlMedicationTime = TextEditingController();
  final TextEditingController _ctrlTime = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Apiprovider apiprovider = Apiprovider();
  Future addMedcation() async {
    if (_formKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x82ff1111),
        title: Column(
          // ignore: prefer_const_literals_to_create_immutables
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: prefer_const_constructors
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: const Text(
                'เพิ่มยาใหม่',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: TextFormField(
                      controller: _ctrlMedicationName,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Medication';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white70,
                          filled: true,
                          labelText: 'ชื่อยา',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: TextFormField(
                      controller: _ctrlMedicationAmount,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter blood sugar';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white70,
                          filled: true,
                          labelText: 'ปริมาณ',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: TextFormField(
                      controller: _ctrlMedicationTime,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter blood sugar';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white70,
                          filled: true,
                          labelText: 'เวลาที่ใช้ยา',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                    child: TextFormField(
                      controller: _ctrlTime,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Date';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white70,
                          filled: true,
                          labelText: 'วันที่เพิ่มยา',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2200));
                        if (pickedDate != null) {
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          setState(() {
                            _ctrlTime.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                    child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color(0x82ff1111))),
                            child: const Text(
                              'บันทึก',
                              style: TextStyle(fontSize: 18),
                            ),
                            onPressed: () => addMedcation())),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color(0x82ff1111))),
                            child: const Text(
                              'คลังยา',
                              style: TextStyle(fontSize: 18),
                            ),
                            onPressed: () => addMedcation())),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
