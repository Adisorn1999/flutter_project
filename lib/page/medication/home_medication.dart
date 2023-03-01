// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter_application/API/api_provider.dart';
// import 'package:flutter_application/components/Dialog/dialog_code200.dart';
// import 'package:flutter_application/model/medicationMode.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:intl/intl.dart';

// import '../../components/Dialog/dialog_addMedication.dart';

// // class HomeMedication extends StatefulWidget {
// //   const HomeMedication({super.key});

// //   @override
// //   State<HomeMedication> createState() => _HomeMedicationState();
// // }

// // class _HomeMedicationState extends State<HomeMedication> {
// //   @override
// //   Apiprovider apiprovider = Apiprovider();

//   late List<MedicationModel?> medicationModel;

//   var jsonResponse = [];
//   var formatter = DateFormat.yMd();

//   Future<List<MedicationModel?>?> getMedication() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final int? user_id = prefs.getInt('userId');
//       var response = await apiprovider.getMedication(user_id!);
//       if (response.statusCode == 200) {
//         print(response.body);
//         jsonResponse = jsonDecode(response.body);
//         medicationModel =
//             jsonResponse.map((e) => MedicationModel.fromJson(e)).toList();
//       }
//     } on Exception catch (e) {
//       // TODO
//       print(e);
//     }
//     return medicationModel;
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("data"),
//         ),
//         body: FutureBuilder(
//           future: getMedication(),
//           builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//             var data = snapshot.data;
//             if (snapshot.connectionState == ConnectionState.done) {
//               return Column(
//                 children: [
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Expanded(
//                       child: ListView.builder(
//                     itemCount: data?.length,
//                     itemBuilder: ((context, index) {
//                       final food = data?[index];
//                       return Card(
//                         child: ListTile(
//                           title: Row(
//                             children: [
//                               Container(
//                                 child: Column(
//                                   children: [
//                                     Text(
//                                       "ชื่อยา ${data?[index]?.medicationName}",
//                                       style: const TextStyle(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.w700,
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 5,
//                                     ),
//                                     Text(
//                                       "  ${data?[index]?.medicationTime}",
//                                       style: const TextStyle(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.w700,
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 5,
//                                     ),
//                                     Text(
//                                       "  ${formatter.format(data?[index]?.time)}",
//                                       style: const TextStyle(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.w700,
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 50,
//                               ),
//                             ],
//                           ),
//                           onTap: () {
//                             print("${data?[index]?.medicationName}");
//                             addMedicationlDialog(context, "title", "message");
//                           },
//                           // leading: Icon(Icons.food_bank),
//                         ),
//                       );
//                     }),
//                   ))
//                 ],
//               );
//             }
//             return const LinearProgressIndicator();
//           },
//         ));
//   }

