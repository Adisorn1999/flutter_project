import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../knowledgDiabetes.dart';
import 'AdviceL4.dart';
import 'adviceL1.dart';
import 'adviceL2.dart';
import 'adviceL3.dart';
import 'adviceL5.dart';

class AdviceHomeLow extends StatelessWidget {
  const AdviceHomeLow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ระดับน้ำตาลในเลือดต่ำ",
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
                      child:
                          const Text('ผู้ป่วยยังรู้สึกตัวช่วยเหลือตัวเองได้่'),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AdviceL1()));
                      })),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                    height: 75,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xcc5286d4))),
                        child: const Text(
                            'ผู้ป่วยหมดสติหรือรู้สึกตัว แต่ช่วยเหลือตัวเองไม่ได้'),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AdviceL2()));
                        })),
              ),
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
                          const Text('อาการอย่างไรบ่งบอกว่าน้ำตาลในเลือดต่ำ'),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AdviceL3()));
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
                      child: const Text('น้ำตาลในเลือดต่ำ ขณะนอนหลับ'),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AdviceL4()));
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
                      child: const Text('ป้องกันภาวะน้ำตาลในเลือดต่ำ'),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AdviceL5()));
                      })),
            ),
          ],
        ),
      ),
    );
  }
}
