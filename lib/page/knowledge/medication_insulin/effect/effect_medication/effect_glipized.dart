import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../../components/foodCare/foodCareTxt1.dart';
import '../../../../../components/foodCare/foodcaretxt1_blue.dart';

class EffectGlipized extends StatelessWidget {
  const EffectGlipized({super.key});

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

            const SizedBox(
              height: 10,
            ),
            FootCareTxt1Blue(" ผลข้างเคียงจากการใช้ยา "),
            FootCareTxt1(
                "ยา Glipizide เป็นยาที่มีผลข้างเคียง โดยผลข้างเคียงที่พบได้ทั่วไปในการใช้ยานี้ได้แก่ อาการคลื่นไส้เล็กน้อย ท้องเสีย ท้องผูก วิงเวียนศีรษะ หน้ามืด มีผื่นแดงตามผิวหนัง เป็นต้น ทว่าหากผู้ป่วยมีอาการแพ้ยาดังกล่าว ควรรีบแจ้งหน่วยแพทย์ฉุกเฉินทันทีเพื่อความปลอดภัย เนื่องจากหากปล่อยไว้อาจเป็นอันตรายได้ ทั้งนี้สัญญาณของการแพ้ยา Glipizide ได้แก่ มีผื่นลมพิษ หายใจลำบาก มีอาการบวมบริเวณใบหน้า ริมฝีปาก ลิ้นและคอ นอกจากนี้ หากผู้ป่วยมีอาการอื่น ๆ เช่น"),
            const SizedBox(
              height: 10,
            ),
            FootCareTxt1(
                " - มีรอยฟกช้ำ เลือดออกง่าย มีอาการเหนื่อย หายใจสั้นและหัวใจเต้นเร็ว "),
            FootCareTxt1(
                " - คลื่นไส้ ปวดท้องส่วนบน มีอาการคัน ความอยากอาหารลดลง ปัสสาวะมีสีเข้ม อุจจาระมีสีโคลน และตัวเหลือง "),
            FootCareTxt1(" - ตัวซีด มีไข้ มีอาการมึนงง"),
            FootCareTxt1(
                " - ปวดศีรษะตุบๆ คลื่นไส้อย่างรุนแรง และอาเจียน หายใจเต้นแรงและเร็ว มีอาการเหงื่อออกและกระหายน้ำ หรือมีความรู้สึกเหมือนจะหมดสติ "),
            FootCareTxt1(
                "  หากมีอาการเหล่านี้ผู้ป่วยควรติดต่อหน่วยแพทย์ฉุกเฉิน หรือไปยังสถานพยาบาลที่ใกล้ที่สุด เพื่อความปลอดภัยของผู้ป่วย"),
          ],
        ),
      ),
    );
  }
}
