import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../components/foodCare/foodCareTxt1.dart';
import '../../../../components/foodCare/foodcaretxt1_blue.dart';
import '../effect/effect_medication/effect_glipized.dart';

class MedicationGlipized extends StatelessWidget {
  const MedicationGlipized({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ยา Glipized",
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
                  'assets/medication-2.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FootCareTxt1Blue(" สรรพคุณ "),
            FootCareTxt1(
                " - 	ควบคุมระดับน้ำตาลในเลือดของผู้ป่วยโรคเบาหวานชนิดที่ 2"),
            const SizedBox(
              height: 10,
            ),
            FootCareTxt1Blue(" กลไกลการออกฤิทธิ์ "),

            FootCareTxt1(
                " - กระตุ้นเบต้าเซลล์จากตับอ่อนให้หลั่งอินซูลินเพิ่มขึ้น "),
            const SizedBox(
              height: 10,
            ),
            FootCareTxt1Blue(" ขนาดเเละวิธีการใช้ "),

            FootCareTxt1(
                " - 2.5 mg. - 5 mg วันละ 1 ครั้ง รับประทานก่อนอาหาร 15-30 นาที "),

            FootCareTxt1(
                " - ใช้ได้ในผู้ป่วยดรคไตรื้อรังโดยไม่ต้องปรับขนาดยาแต่ตั้องระวังในผู้ป่วยที่ GFR น้อยกว่า 10 ml/min/1.73m"),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const EffectGlipized()));
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
