import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../../components/foodCare/foodCareTxt1.dart';
import '../../../../../components/foodCare/foodcaretxt1_blue.dart';

class EffectGlibenclamide extends StatelessWidget {
  const EffectGlibenclamide({super.key});

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

            const SizedBox(
              height: 10,
            ),
            FootCareTxt1Blue(" ผลข้างเคียงจากการใช้ยา "),
            FootCareTxt1(
                "หากพบว่ามีอาการแพ้ยา เช่น คัด ผื่นขึ้นแดง ลมพิษ ใบหน้าบวม ลิ้นบวม หายใจผิดปกติ ควรพบแพทย์โดยเร็ว"),
            const SizedBox(
              height: 10,
            ),
            FootCareTxt1(
                "ผลข้างเคียงทั่วไปที่อาจเกิดขึ้นขากการใช้ยา หากพบว่าเป็นต่อเนื่องหรือ รบกวนการใช้ชีวิตประจำวัน ควรแจ้งให้แพทย์ทราบทันที โดยมีอาการดังนี้"),
            FootCareTxt1(
                " - คลื่นไส้ ปวดท้องส่วนบน มีอาการคัน ความอยากอาหารลดลง ปัสสาวะมีสีเข้ม อุจจาระมีสีโคลน และตัวเหลือง "),
            FootCareTxt1(" - ตัวซีด มีไข้ มีอาการมึนงง"),
            FootCareTxt1(
                " - ปวดศีรษะตุบๆ คลื่นไส้ อาเจียน แสบยอดอก ปวดท้อง ท้องเสีย "),
            FootCareTxt1(
                " - ภาวะน้ำตาลในเลือดต่ำ โดยจะทำให้มีอาการต่อไปนี้ มือสั่น หน้ามืด วิงเวียน เหงื่อออก ปวดศรีษะ ชาหรือปวดเสียวคล้ายหนามแทงบริเวณริมฝีปาก อ่อนเพลีย หน้าซีด ตัวซีด หัวใจสั้น วิตกกังวล หงุดหงิด กระวนกระวาย อารมณ์แปรปวน รวมถึงปัสสาวะสีเข้ม เลือดออกหรือฟกซ้ำบ่อย ผิวหน้งไวต่อแสงแดด มีไข้ ตัวสั่นเจ็บคอ"),
          ],
        ),
      ),
    );
  }
}
