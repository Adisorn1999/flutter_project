import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../components/foodCare/foodCareTxt1.dart';
import '../../../../components/foodCare/foodcaretxt1_blue.dart';
import '../effect/effect_medication/effect_pioglitazone.dart';

class MedicationPioglitazone extends StatelessWidget {
  const MedicationPioglitazone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ยา Pioglitazone",
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
                  'assets/medication-4.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FootCareTxt1Blue(" สรรพคุณ "),
            FootCareTxt1(
                " - 		รักษาโรคเบาหวานประเภทที่ 2 ช่วยคุมระดับน้ำตาลในเลือด"),
            const SizedBox(
              height: 10,
            ),
            FootCareTxt1Blue(" กลไกลการออกฤิทธิ์ "),

            FootCareTxt1(
                " - กระตุ้นเบต้าเซลล์จากตับอ่อนหลั่งสารอินซูลินเพิ่มขึ้น"),
            const SizedBox(
              height: 10,
            ),
            FootCareTxt1Blue(" ขนาดเเละวิธีการใช้ "),

            FootCareTxt1(
                " - รับประทานยาวันละ 15 - 30 mg ต่อวัน หากมีความจำเป็นสมมารถเพิ่มปริมาณยาได้ทีละน้อย แต่สูงสุดไม่เกิน 45 mg"),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const EffectPioglitazone()));
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
