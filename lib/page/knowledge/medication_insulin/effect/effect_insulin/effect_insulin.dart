import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../../components/foodCare/foodCareTxt1.dart';
import '../../../../../components/foodCare/foodcaretxt1_blue.dart';

class EffectInsulin extends StatelessWidget {
  const EffectInsulin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ยาฉีด Insulin",
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
            FootCareTxt1Blue(" ผลข้างเคียงและอาการแพ้อินซูลิน "),
            FootCareTxt1(
                "เบื้องต้นผู้ที่มีผลข้างเคียงหรือมีอาการแพ้อินซูลิน ส่วนใหญ่มักจะแสดงอาการดังต่อไปนี้"),

            FootCareTxt1(
                " - ในผู้ที่มีภาวะน้ำตาลในเลือดต่ำ (Hypoglycemia) มักมีอาการปวดศีรษะ เหงื่อออกผิดปกติ ใจสั่น กระสับกระส่าย อ่อนเพลีย ปากหรือริมฝีปากชา หัวใจเต้นเร็ว วิตกกังวล สายตาพร่ามัว เป็นลม เป็นต้น"),
            FootCareTxt1(
                " - ในผู้ที่มีภาวะน้ำตาลในเลือดสูง (Hyperglycemia) มักมีอาการปัสสาวะบ่อย กระหายน้ำ รู้สึกหิว ปวดศีรษะ อ่อนเพลีย คลื่นไส้อาเจียน เบลอ หน้ามืด เป็นต้น"),
          ],
        ),
      ),
    );
  }
}
