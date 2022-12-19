import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../components/foodCare/foodCareTxt1.dart';
import '../../../../components/foodCare/foodcaretxt1_blue.dart';
import '../effect/effect_medication/effect_glibenclamide.dart';

class MedicationGlibenclamide extends StatelessWidget {
  const MedicationGlibenclamide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ยา Glibenclamide",
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: sized_box_for_whitespace
            Container(
              width: double.infinity,
              height: 254,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
                child: Image.asset(
                  'assets/medication-3.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FootCareTxt1Blue(" สรรพคุณ "),
            FootCareTxt1(
                " - 		รักษาเบาหวานชนิดที่ 2 (Diabetes Mellitus Type 2)"),
            const SizedBox(
              height: 10,
            ),
            FootCareTxt1Blue(" กลไกลการออกฤิทธิ์ "),

            FootCareTxt1(
                " - กระตุ้นให้ตับอ่อนหลั่งสารอินซูลินเพิ่มขึ้น ซึ่งจะช่วยควบคุมและลดระดับน้ำตาลในเลือดได้  "),
            const SizedBox(
              height: 10,
            ),
            FootCareTxt1Blue(" ขนาดเเละวิธีการใช้ "),

            FootCareTxt1(
                " - รับประทานเบื่องต้น 2.5 - 5mg ต่อวัน ในสัปดาห์ถัดไป และหากใช้ยามากกว่า 10 mg ต่อวัน ควรแบ่งใช้ 2 ครั้ง สูงสุดไม่เกิน 20 mg ต่อวัน"),

            FootCareTxt1(" - ผู้สูงอายุควรรับประทานเริ้มต้น 1.25 mg ต่อวัน"),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const EffectGlibenclamide()));
              },
              child: const Text(
                'ผลข้างเคียงจากการใช้ยา อ่านต่อ',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
