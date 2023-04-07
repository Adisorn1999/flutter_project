import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class EditName1 extends StatelessWidget {
  const EditName1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Alert Dialog')),
        body: Center(
          child: ElevatedButton(
            child: Text('Show Dialog'),
            onPressed: () {
              _showDialog(context);
            },
          ),
        ),
      ),
    );
  }

  static TextEditingController _textFieldController = TextEditingController();

  static TextEditingController getTextFieldController() => _textFieldController;

  static void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter some text'),
          content: TextField(
            controller: getTextFieldController(),
            decoration: InputDecoration(hintText: "Text"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () {
                print(getTextFieldController().text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
