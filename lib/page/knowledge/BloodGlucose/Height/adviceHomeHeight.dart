import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../Low/adviceL1.dart';
import 'adviceH1.dart';
import 'adviceH2.dart';
import 'adviceH3.dart';
import 'adviceH4.dart';

class AdviceHomeHeight extends StatelessWidget {
  const AdviceHomeHeight({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ระดับน้ำตาลในเลือดสูง",
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                  height: 75,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xcc5286d4))),
                      child: const Text('การปฏิบัติเบื้องต้น'),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AdviceH1()));
                      })),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                  height: 75,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xcc5286d4))),
                      child:
                          const Text('สาเหตุของการเกิด ระดับน้ำตาลในเลือดสูง'),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AdviceH2()));
                      })),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                  height: 75,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xcc5286d4))),
                      child:
                          const Text('อาการที่บ่งบอกว่า ระดับน้ำตาลในเลือดสูง'),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AdviceH3()));
                      })),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                  height: 75,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xcc5286d4))),
                      child: const Text('ป้องกันภาวะ ระดับน้ำตาลในเลือดสูง'),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AdviceH4()));
                      })),
            ),
          ],
        ),
      ),
    );
  }
}
