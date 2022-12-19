import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/components/foodCare/foodcaretxt1_blue.dart';

import '../../../../components/foodCare/foodCareTxt1.dart';
import '../effect/effect_medication/effect_metformin.dart';

class MedicationMetformin extends StatelessWidget {
  const MedicationMetformin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ยา Metformin",
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
              height: 160,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
                child: Image.asset(
                  'assets/medication-1.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FootCareTxt1Blue(" สรรพคุณ "),
            FootCareTxt1(
                " - รักษาโรคเบาหวานชนิดที่ 2 ช่วยควบคุมระดับน้ำตาลในเลือด"),
            const SizedBox(
              height: 10,
            ),
            FootCareTxt1Blue(" กลไกลการออกฤิทธิ์ "),

            FootCareTxt1(
                " - ลดการสร้างกลูโคสของตับ ออกฤทธื์โดยการลดการดื้อต่ออินซูลิน ทำให้เพิ่มการนำกลูโคสไปใช้ โดยเซลล์กล้ามเนื้อลาย และลดการสร้างกลูโคสจากตับ "),
            const SizedBox(
              height: 10,
            ),
            FootCareTxt1Blue(" ขนาดเเละวิธีการใช้ "),

            FootCareTxt1(
                " - 500mg. - 1g วันละ 2-3 ครั้ง หลังอาหาร 15-30 นาที "),

            FootCareTxt1(
                " - ไม่แนะนำให้ใช้ถ้ามีค่า serum creatinine มากกว่า 1.5 mg/dt ในผู้ชาย หรือ มากกว่า 1.4mg/dt ในผู้หญิง"),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const EffectMetformin()));
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
