import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/API/api_provider.dart';

import '../../components/Dialog/dialog_validate.dart';

class AddFoodDetail extends StatefulWidget {
  const AddFoodDetail({super.key});

  @override
  State<AddFoodDetail> createState() => _AddFoodDetailState();
}

class _AddFoodDetailState extends State<AddFoodDetail> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _ctrlname = TextEditingController();
  final TextEditingController _ctrlcalorie = TextEditingController();

  Apiprovider apiprovider = Apiprovider();
  Future addFoodDetail() async {
    if (_formKey.currentState!.validate()) {}

    try {
      var response =
          await apiprovider.addFoodDetail(_ctrlname.text, _ctrlcalorie.text);
      if (response.statusCode == 200) {
        print(response.body);
        // ignore: use_build_context_synchronously
        normalDialog(context, "title", "message");
        _formKey.currentState!.reset();
      }
    } on Exception catch (e) {
      // TODO
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("เพิ่มอาหาร"),
      ),
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
                    child: TextFormField(
                      controller: _ctrlname,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter food name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white70,
                          filled: true,
                          labelText: 'ชื่ออาหาร',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
                    child: TextFormField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(3),
                      ],
                      keyboardType: TextInputType.number,
                      controller: _ctrlcalorie,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter calorie';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white70,
                          filled: true,
                          labelText: 'แคลอรี่',
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
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color(0x82ff1111))),
                            child: const Text(
                              'บันทึก',
                              style: TextStyle(fontSize: 18),
                            ),
                            onPressed: () => addFoodDetail())),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
