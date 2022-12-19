import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../../components/foodCare/foodCareTxt1.dart';
import '../../../../../components/foodCare/foodcaretxt1_blue.dart';

class EffectMetformin extends StatelessWidget {
  const EffectMetformin({super.key});

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

            const SizedBox(
              height: 10,
            ),
            FootCareTxt1Blue(" ผลข้างเคียงจากการใช้ยา "),
            FootCareTxt1(
                " ยา Metformin แม้จะเป็นยาที่ใช้รักษาโรคเบหวาน แต่ก็อาจจะก่อให้เกิดผลข้างเคียงได้ ้เช่น ภาววะเลือดเป็นกรดชนิดอันตรายถึงแก่ชีวิต ซึ่งอาจมีดอกาศเกิดขึ้นได้ โดยเฉพาะผุ้ป่วยโรคตับ โรคไต หัวใจวาย หรือติดเชื่อรุนแรง ขณะที่ผู้ที่มีภาวะขาดน้ำ หรือดื่มเครื่องดื่มแอลกอฮอล์ในปริมาณสูงก็อาจเสี่ยงด้วยเช่นกัน นอกจากนี้ยังมีผลข้างเคียงที่พบได้บ่อย เช่น"),
            const SizedBox(
              height: 10,
            ),
            FootCareTxt1(" - คลื่นไส้ อาเจียน "),
            FootCareTxt1(" - ท้องเสี่ย "),
            FootCareTxt1(" - หายใจเร็ว หรือ หายใจตื้น"),
            FootCareTxt1(" - มีไข้หนาวสั่น "),
            FootCareTxt1(" - รู้สึกไม่สบายตัว "),
            FootCareTxt1(" - รู้สึกไม่สบายท้อง "),
            FootCareTxt1(" - ปวดหลังหรือปวดกล้ามเนื้อ"),
            FootCareTxt1(" - ปัสสาวะติดขัด "),
            FootCareTxt1(" - ง่วงเหงาหาวนอนตลอดเวลา "),
          ],
        ),
      ),
    );
  }
}
