// import 'package:flutter/material.dart';
// import 'package:flutter_application/page/home.dart';

// Future<void> editNameDialog(
//     BuildContext context, String title, String message) async {
//   showDialog(
//       context: context,
//       builder: ((context) => AlertDialog(
//             title: Text(title),
//             content: Text(message),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.pop(context, 'Cancel'),
//                 child: const Text('ยกเลิก'),
//               ),
//               TextButton(
//                 onPressed: () => Navigator.of(context).pushReplacement(
//                     MaterialPageRoute(
//                         builder: ((context) => const HomePage()))),
//                 child: const Text('ตกลง'),
//               ),
//             ],
//           )));
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_application/page/home.dart';

// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: showDialog(editNameDialog(c)),
//         ),
//       ),
//     );
//   }

//   static TextEditingController _textFieldController = TextEditingController();
//   static TextEditingController getTextFieldController() => _textFieldController;

//   Future<void> editNameDialog(
//       BuildContext context, String title, String message) async {
//     showDialog(
//         context: context,
//         builder: ((context) => AlertDialog(
//               title: Text('Enter some text'),
//               content: TextField(
//                 controller: getTextFieldController(),
//                 decoration: InputDecoration(hintText: "Text"),
//               ),
//               actions: <Widget>[
//                 TextButton(
//                   child: Text('CANCEL'),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                 ),
//                 TextButton(
//                   child: Text('OK'),
//                   onPressed: () {
//                     print(getTextFieldController().text);
//                     Navigator.of(context).pop();
//                   },
//                 ),
//               ],
//             )));
//   }
// }
