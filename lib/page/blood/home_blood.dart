import 'package:flutter/material.dart';
import 'package:flutter_application/page/blood/%E0%B8%B4blood_of_day.dart';
import 'package:flutter_application/page/blood/test1.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BloodHome extends StatefulWidget {
  const BloodHome({super.key});

  @override
  State<BloodHome> createState() => _BloodHomeState();
}

class _BloodHomeState extends State<BloodHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        child: const Text(
                          'รายงานระดับน้ำตาลในเลือด',
                          style: TextStyle(fontSize: 18),
                        ),
                        onPressed: () async {
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const BloodOfDay()));
                        })),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        child: const Text(
                          'รายงานระดับน้ำตาลในเลือดแบบกราฟ',
                          style: TextStyle(fontSize: 18),
                        ),
                        onPressed: () async {
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Test1()));
                        })),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
