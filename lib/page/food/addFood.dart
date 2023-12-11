import 'dart:convert';

import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/API/api_provider.dart';
import 'package:flutter_application/components/Dialog/dialog_code200.dart';
import 'package:flutter_application/model/Foodsmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/Dialog/dialog_addFoodDetail.dart';
import '../../components/Dialog/dialog_addFoods.dart';
import '../../components/Dialog/dialog_validate.dart';
import '../../model/search.dart';
import 'addFood_detail.dart';
import 'foodDatial.dart';

class AddFood extends StatefulWidget {
  const AddFood({super.key});

  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  @override
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _ctrlFoodName = TextEditingController();
  final TextEditingController _ctrlFoodcalorie = TextEditingController();

  void initState() {
    // TODO: implement initStateuper.initState();
    foodsData = foodsModel;

    getFoods();
    super.initState();
  }

  void _incrementCounter() {
    // Navigator.push(context,
    //     MaterialPageRoute(builder: (context) => const AddFoodDetail()));
    dialogCode200(context, "title", "message");
  }

  double sizeBoxSearch = 0;
  late List<FoodsModel?> foodsModel = [];
  List<Search> _data = [];
  List<Search> _foundUsers = [];

  late List<FoodsModel?> foodsData = [];
  var f = <String>[];

  var jsonResponse = [];
  final _ctrlSearch = TextEditingController();

  Apiprovider apiprovider = Apiprovider();

  Future<List<FoodsModel?>?> getFoods() async {
    var response = await apiprovider.getFoods();
    try {
      if (response.statusCode == 200) {
        print(response.body);
        jsonResponse = jsonDecode(response.body);
        foodsModel = jsonResponse.map((e) => FoodsModel.fromJson(e)).toList();

        // for (int i = 0; i < foodsModel.length; i++) {
        //   // ignore: unnecessary_new
        //   FoodsModel data = new FoodsModel(
        //       foodId: foodsModel[i]!.foodId, foodName: foodsModel[i]!.foodName);
        //   _data.add(data);
        // }
      } else {
        print("Api error");
      }
    } on Exception catch (e) {
      // TODO
      print('error $e');
    }
    return foodsModel;
  }

  Future addFood() async {
    if (_formKey.currentState!.validate()) {
      var response =
          await apiprovider.addFood(_ctrlFoodName.text, _ctrlFoodcalorie.text);
      if (response.statusCode == 200) {
        print(response.body);
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['ok']) {
          print(jsonResponse);
          // ignore: use_build_context_synchronously

          _formKey.currentState!.reset();

          Navigator.of(context).pop();

          // ignore: use_build_context_synchronously
          addFoodslDialog(context, "บันทึกสำเร็จ", "บันทึกสำเร็จ");
          // Navigator.of(context).pushReplacement(
          //     MaterialPageRoute(builder: ((context) => const AddFood())));
        }
      }
    }
    return jsonResponse;
  }

  // void _runFilter(String enteredKeyword) {
  //   print("_runFilter");
  //   List<Search> results = [];
  //   if (enteredKeyword.isEmpty) {
  //     setState(() {
  //       sizeBoxSearch = 0;
  //     });
  //   } else {
  //     sizeBoxSearch = 500;

  //     results = _data
  //         .where((user) => user.foodName
  //             .toLowerCase()
  //             .contains(enteredKeyword.toLowerCase()))
  //         .toList();
  //     print("123");
  //   }
  //   // setstate เพื่อทำการ Refresh  UI 😁

  //   _foundUsers = results;
  // }
  void filterSearchResults(String enteredKeyword) {
    setState(() {
      foodsData = foodsModel
          .where((foodsDatas) => foodsDatas!.foodName
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      print(foodsData);
    });
    print("object");
  }

  // ignore: unused_element
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ชื่ออาหารใหม่'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ignore: avoid_unnecessary_containers
                Container(
                  child: TextFormField(
                    controller: _ctrlFoodName,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณาใส่ชื่ออาหาร';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(hintText: "ชื่ออาหาร"),
                    autocorrect: false,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                Container(
                  child: TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(4),
                    ],
                    keyboardType: TextInputType.number,
                    controller: _ctrlFoodcalorie,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณาใส่ปริมาณ (กิโลเเคลอรี่)';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: "ปริมาณ (กิโลเเคลอรี่)"),
                    autocorrect: false,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ยกเลิก'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            // TextButton(child: const Text('SAVE'), onPressed: () => addFood()),
            TextButton(
              child: const Text('บันทึก'),
              onPressed: () {
                addFood();

                if (_formKey.currentState!.validate()) {}
                // Navigator.of(context).pushReplacement(
                //     MaterialPageRoute(builder: ((context) => const AddFood())));
                // addFoodslDialog(context, "บันทึกสำเร็จ1", "บันทึกสำเร็จ");
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("เพิ่มรายการอาหาร"),
        ),
        body: FutureBuilder(
          future: getFoods(),
          builder: ((context, snapshot) {
            var data = snapshot.data;
            if (!snapshot.hasData) {
              // ignore: avoid_unnecessary_containers
              return Container(
                child: const LinearProgressIndicator(),
              );
            }
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                          // style: ButtonStyle(
                          //     backgroundColor: MaterialStateProperty.all<Color>(
                          //         Color(0x82ff1111))),
                          child: Text('รายงานการให้พลังงาน',
                              style: GoogleFonts.roboto(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          onPressed: () => Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                                  builder: ((context) =>
                                      const FoodDatial()))))),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: data?.length,
                  itemBuilder: ((context, index) {
                    final food = data?[index];
                    return Card(
                      child: ListTile(
                        title: Row(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${data?[index]?.foodId}",
                                      style: const TextStyle(
                                          fontSize: 16.5,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ]),
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Text(
                                    "${data?[index]?.foodName}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    "${data?[index]?.calorie.toStringAsFixed(2)} กิโลเเคลอรี่",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            )
                          ],
                        ),
                        onTap: () async {
                          print("${data?[index]?.foodName}");
                          print("${data?[index]?.calorie}");

                          final int? foodId = data?[index]?.foodId;
                          final String? food_name = data?[index]?.foodName;
                          final double? calorie = data?[index]?.calorie;
                          final double? calorie1 = data?[index]?.calorie;

                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.setInt('foodId', foodId!);
                          await prefs.setString('food_name', food_name!);
                          await prefs.setDouble('calorie', calorie!);
                          await prefs.setDouble('calorie1', calorie1!);
                          // ignore: use_build_context_synchronously
                          addFoodDatailDialog(context, "เพิ่มรายการอาหาร", "");
                        },
                        // leading: Icon(Icons.food_bank),
                      ),
                    );
                  }),
                )),
                const SizedBox(
                  height: 70,
                ),
              ],
            );
          }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showDialog(context),
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ));

    // This trailing comma makes auto-forma);
  }
}
