import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../../components/foodCare/foodCareTxt1.dart';
import '../../../../../components/foodCare/foodcaretxt1_blue.dart';

class EffectPioglitazone extends StatelessWidget {
  const EffectPioglitazone({super.key});

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

            const SizedBox(
              height: 10,
            ),
            FootCareTxt1Blue(" ผลข้างเคียงจากการใช้ยา "),
            FootCareTxt1(
                " - ไม่รุนแรง: ปวดศีรษะ น้ำหนักเพิ่มขึ้น อาการคล้ายเป็นหวัด ปวดฟันหรือเจ็บในปากเจ็บคอ"),

            FootCareTxt1(
                " - รุนแรง: กระวนกระวายสับสน ไม่มีสมาธิ สายตาพร่ามัว หายใจเร็ว น้ำหนักเพิ่มขึ้นอย่างรวดเร็ว ไอแห้งเป็นประจำ มือชา หรือเท้าบวม หัวใจเต้นช้า ผื่นคัน ตัวเหลืองตาเหลือง ปัสสาวะสีเข้มผิดปกติ ตัวซีดเย็นสั่น ปวดกล้ามเนื้อ ท้องเสีย เหนื่อยมากผิดปกติ คลื่นไส้ อาเจียน เบื่ออาหาร หากเกิดอาการเหล่านี้ควรพบแพทย์ทันที"),
          ],
        ),
      ),
    );
  }
}
