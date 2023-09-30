// /// Bar chart example
// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:flutter/material.dart';

// class SimpleBarChart extends StatelessWidget {
//   final List<charts.Series> seriesList;
//   final bool animate;

//   SimpleBarChart(this.seriesList, {this.animate});

//   /// Creates a [BarChart] with sample data and no transition.
//   factory SimpleBarChart.withSampleData() {
//     return new SimpleBarChart(
//       _createSampleData(),
//       // Disable animations for image tests.
//       animate: false,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new charts.BarChart(
//       seriesList,
//       animate: animate,
//     );
//   }

//   /// Create one series with sample hard coded data.
//   static List<charts.Series<OrdinalSales, String>> _createSampleData() {
//     final data = [
//       new OrdinalSales('2014', 5),
//       new OrdinalSales('2015', 25),
//       new OrdinalSales('2016', 100),
//       new OrdinalSales('2017', 75),
//     ];

//     return [
//       new charts.Series<OrdinalSales, String>(
//         id: 'Sales',
//         colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//         domainFn: (OrdinalSales sales, _) => sales.year,
//         measureFn: (OrdinalSales sales, _) => sales.sales,
//         data: data,
//       )
//     ];
//   }
// }

// /// Sample ordinal data type.
// class OrdinalSales {
//   final String year;
//   final int sales;

//   OrdinalSales(this.year, this.sales);
// }

// import 'dart:convert';

// import 'package:easy_search_bar/easy_search_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_application/API/api_provider.dart';
// import 'package:flutter_application/components/Dialog/dialog_code200.dart';
// import 'package:flutter_application/model/Foodsmodel.dart';

// import '../../components/Dialog/dialog_addFoods.dart';
// import '../../components/Dialog/dialog_validate.dart';
// import '../../model/search.dart';
// import 'addFood_detail.dart';

// class AddFood extends StatefulWidget {
//   const AddFood({super.key});

//   @override
//   State<AddFood> createState() => _AddFoodState();
// }

// class _AddFoodState extends State<AddFood> {
//   @override
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _ctrlFoodName = TextEditingController();
//   final TextEditingController _ctrlFoodcalorie = TextEditingController();

//   void initState() {
//     super.initState();
//     // TODO: implement initStateuper.initState();

//     getFoods();
//   }

//   void _incrementCounter() {
//     // Navigator.push(context,
//     //     MaterialPageRoute(builder: (context) => const AddFoodDetail()));
//     dialogCode200(context, "title", "message");
//   }

//   double sizeBoxSearch = 0;
//   late List<FoodsModel?> _foodsModel;
//   List<Search> _data = [];
//   List<Search> _foundUsers = [];

//   var jsonResponse = [];
//   final _ctrlSearch = TextEditingController();

//   Apiprovider apiprovider = Apiprovider();

//   Future<List<FoodsModel?>?> getFoods() async {
//     var response = await apiprovider.getFoods();
//     try {
//       if (response.statusCode == 200) {
//         print(response.body);
//         jsonResponse = jsonDecode(response.body);
//         _foodsModel = jsonResponse.map((e) => FoodsModel.fromJson(e)).toList();

//         for (int i = 0; i < _foodsModel.length; i++) {
//           // ignore: unnecessary_new
//           Search data = new Search(
//               foodId: _foodsModel[i]!.foodId,
//               foodName: _foodsModel[i]!.foodName);
//           _data.add(data);
//         }
//       } else {
//         print("Api error");
//       }
//     } on Exception catch (e) {
//       // TODO
//       print('error $e');
//     }
//     return _foodsModel;
//   }

//   Future addFood() async {
//     if (_formKey.currentState!.validate()) {}
//     var response =
//         await apiprovider.addFood(_ctrlFoodName.text, _ctrlFoodcalorie.text);
//     if (response.statusCode == 200) {
//       print(response.body);
//       var jsonResponse = jsonDecode(response.body);
//       if (jsonResponse['ok']) {
//         print(jsonResponse);
//         // ignore: use_build_context_synchronously
//         //addFoodslDialog(context, "บันทึกสำเร็จ1", "บันทึกสำเร็จ");
//         _formKey.currentState!.reset();
//         // Navigator.of(context).pushReplacement(
//         //     MaterialPageRoute(builder: ((context) => const AddFood())));
//       }
//     }
//     return jsonResponse;
//   }

//   void _runFilter(String enteredKeyword) {
//     print("_runFilter");
//     List<Search> results = [];
//     if (enteredKeyword.isEmpty) {
//       setState(() {
//         sizeBoxSearch = 0;
//       });
//     } else {
//       sizeBoxSearch = 500;

//       results = _data
//           .where((user) => user.foodName
//               .toLowerCase()
//               .contains(enteredKeyword.toLowerCase()))
//           .toList();
//       print("123");
//     }
//     // setstate เพื่อทำการ Refresh  UI 😁

//     _foundUsers = results;
//   }

//   // ignore: unused_element
//   void _showDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('ชื่อใหม่ของคุณ'),
//           content: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 // ignore: avoid_unnecessary_containers
//                 Container(
//                   child: TextFormField(
//                     controller: _ctrlFoodName,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'กรุณาใส่ชื่ออาหาร';
//                       }
//                       return null;
//                     },
//                     decoration: const InputDecoration(hintText: "ชื่ออาหาร"),
//                     autocorrect: false,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),

//                 Container(
//                   child: TextFormField(
//                     controller: _ctrlFoodcalorie,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'กรุณาใส่ปริมาณ (กิโลเเคลอรี่)';
//                       }
//                       return null;
//                     },
//                     decoration: const InputDecoration(
//                         hintText: "ปริมาณ (กิโลเเคลอรี่)"),
//                     autocorrect: false,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('ยกเลิก'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             // TextButton(child: const Text('SAVE'), onPressed: () => addFood()),
//             TextButton(
//               child: const Text('บันทึก'),
//               onPressed: () {
//                 addFood();
//                 Navigator.of(context).pop();
//                 // Navigator.of(context).pushReplacement(
//                 //     MaterialPageRoute(builder: ((context) => const AddFood())));
//                 addFoodslDialog(context, "บันทึกสำเร็จ1", "บันทึกสำเร็จ");
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//   Add Food
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("เพิ่มรายการอาหาร"),
//         ),
//         body: FutureBuilder(
//           future: getFoods(),
//           builder: ((context, snapshot) {
//             var data = snapshot.data;
//             if (!snapshot.hasData) {
//               // ignore: avoid_unnecessary_containers
//               return Container(
//                 child: const LinearProgressIndicator(),
//               );
//             }
//             return Column(
//               children: [
//                 Container(
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: TextField(
//                       controller: _ctrlSearch,
//                       decoration: InputDecoration(
//                           prefixIcon: const Icon(Icons.search),
//                           hintText: 'รายการอาหาร',
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(20.0),
//                               borderSide:
//                                   const BorderSide(color: Colors.black))),
//                       onChanged: (value) => _runFilter(value),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                     child: ListView.builder(
//                   itemCount: data?.length,
//                   itemBuilder: ((context, index) {
//                     final food = data?[index];
//                     return Card(
//                       child: ListTile(
//                         title: Row(
//                           children: [
//                             Container(
//                               height: 60,
//                               width: 60,
//                               decoration: BoxDecoration(
//                                   color: Colors.blue,
//                                   borderRadius: BorderRadius.circular(10)),
//                               child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text(
//                                       "${data?[index]?.foodId}",
//                                       style: const TextStyle(
//                                           fontSize: 16.5,
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.white),
//                                     ),
//                                   ]),
//                             ),
//                             const SizedBox(
//                               width: 50,
//                             ),
//                             Container(
//                               child: Column(
//                                 children: [
//                                   Text(
//                                     "${data?[index]?.foodName}",
//                                     style: const TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w700,
//                                     ),
//                                   ),
//                                   Text(
//                                     "${data?[index]?.calorie} กิโลเเคลอรี่",
//                                     style: const TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w700,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 50,
//                             )
//                           ],
//                         ),
//                         onTap: () {
//                           print("${data?[index]?.foodName}");
//                         },
//                         // leading: Icon(Icons.food_bank),
//                       ),
//                     );
//                   }),
//                 ))
//               ],
//             );
//           }),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () => _showDialog(context),
//           tooltip: 'Increment',
//           child: const Icon(Icons.add),
//         ));
//     // This trailing comma makes auto-forma);
//   }
// }
