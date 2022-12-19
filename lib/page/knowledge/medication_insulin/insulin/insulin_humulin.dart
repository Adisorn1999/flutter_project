import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../components/foodCare/foodCareTxt1.dart';
import '../../../../components/foodCare/foodcaretxt1_blue.dart';
import '../effect/effect_insulin/effect_humulin.dart';

class InsulinHumulin extends StatelessWidget {
  const InsulinHumulin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "อินซูลินโดยวิธีฉีด (Humulin: NPH)",
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
                  'assets/insulin-2.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FootCareTxt1Blue(" วิธีฉีด "),
            FootCareTxt1(
                "ฉีด Subcutaneous (SC) เอียงเข็ม 45-90 องศา (เปลี่ยนที่ฉีดทุกวันเพื่อลดการเกิด lipodystrophy) บริเวรที่มักจะใช้เพื่อฉีดอินซูลินคือ บริเวณต้นแขน ต้นขาส่วนหน้าและส่วนข้าง รวมทั้งบริเวณช่องท้อง รวมทั้งอย่าฉีดอินซูลินในบริเวณที่ใกล้กับสะดือเกินกว่า 2 นิ้ว"),

            const SizedBox(
              height: 10,
            ),
            FootCareTxt1Blue(" การเตรียมยาในกรณีที่ใช้อินซูลิน "),

            FootCareTxt1(
                " ห้ามเขย่าขวด ใช้วิธีกลิ้งขวดบนฝ่ามือ ถ้าต้องผสม ดูดชนิดใสก่อนเสมอ ห้ามฉีด NPH ทาง IM และ IV"),

            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const EffectHumulin()));
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
