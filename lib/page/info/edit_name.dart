import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/API/api_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/Dialog/dialog_validate.dart';

class Editname extends StatefulWidget {
  const Editname({super.key});

  @override
  State<Editname> createState() => _EditnameState();
}

class _EditnameState extends State<Editname> {
  final _formKey = GlobalKey<FormState>();
  final _ctrlFirstName = TextEditingController();
  final _ctrlLastName = TextEditingController();

  Apiprovider apipovider = Apiprovider();
  Future updatename() async {
    if (_formKey.currentState!.validate()) {}
    final prefs = await SharedPreferences.getInstance();
    final int? user_id = prefs.getInt('userId');
    var response = await apipovider.updatename(
        _ctrlFirstName.text, _ctrlLastName.text, user_id!);
    if (response.statusCode == 200) {
      print(response.body);
      normalDialog(context, "title", "message");
      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit profile"),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                  child: TextFormField(
                    controller: _ctrlFirstName,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณาใส่ชื่อ';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        labelText: 'ชื่อจริง',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                  child: TextFormField(
                    controller: _ctrlLastName,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณาใส่นามสกุล';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        labelText: 'นามสกุล',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
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
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color(0x82ff1111))),
                          child: const Text(
                            'บันทึก',
                            style: TextStyle(fontSize: 18),
                          ),
                          onPressed: () => updatename())),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
