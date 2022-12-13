import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/page/knowledge/BloodGlucose/Height/adviceHomeHeight.dart';

import '../knowledgDiabetes.dart';
import 'Low/adviceL1.dart';
import 'Low/adviceHomeLow.dart';

class BloodGlucoseHome extends StatelessWidget {
  const BloodGlucoseHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ระดับตาลในเลือด",
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            // ignore: avoid_unnecessary_containers
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                    height: 65,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xcc5286d4))),
                        child: const Text('ระดับน้ำตาลในเลือดต่ำ'),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AdviceHomeLow()));
                        })),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                    height: 65,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xcc5286d4))),
                        child: const Text('ระดับน้ำตาลในเลือดสูง'),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AdviceHomeHeight()));
                        })),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
