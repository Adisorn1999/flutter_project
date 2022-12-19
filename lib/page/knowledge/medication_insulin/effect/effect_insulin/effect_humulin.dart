import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/components/foodCare/foodcaretxt1_blue.dart';

import '../../../../../components/foodCare/foodCareTxt1.dart';

class EffectHumulin extends StatelessWidget {
  const EffectHumulin({super.key});

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

            const SizedBox(
              height: 10,
            ),
            FootCareTxt1Blue(" อาการข้างเคียงและข้อควรปฏิบัติ "),
            FootCareTxt1(
                " 1. ภาวะน้ำตาลในเลือดต่ำ เป็นผลจากการให้อินซูลินมากเกินไป รับประทานอาหารน้อยเกินไป ผิดเวลา หรือช่วงระหว่างมื้อนานเกินไป ออกกำลังกายหรือทำงานมากกว่าปกติ อาการที่เกิดมีได้หลายอย่าง เช่น ปวดหัว เหงื่อออก ตัวเย็น ใจสั่น กระสับกระส่าย อ่อนเพลีย ชาในปากหรือริมฝีปาก เดินเซ หงุดหงิด มองภาพไม่ชัด ถ้ามีอาการเหล่านี้ให้ดื่มน้ำผลไม้ หรือรับประทานของที่มีน้ำตาลผสม (ห้ามใช้น้ำตาลเทียม) และพบแพทย์ทันที"),
            FootCareTxt1(
                " 2. ภาวะน้ำตาลในเลือดสูง เป็นผลจากการได้รับอินซูลินไม่เพียงพอ หรือรับประทานมากเกินไป จะปัสสาวะบ่อยกระหายน้ำ หิว ปวดหัว อ่อนเพลีย คลื่นไส้ มึนงง ถ้าเป็นลมให้นำส่งโรงพยาบาลทันที"),
            FootCareTxt1Blue(" การเก็บรักษา "),
            FootCareTxt1(
                "  - อินซูลินที่ยังไม่ได้เปิดใช้ หากเก็บที่อุณหภูมิ 2 - 8 องศาเซลเซียส เก็บได้นานเท่ากับอายุยาข้างขวดแต่สามารถเก็บไว้ในอุณหภูมิห้อง (ประมาณ 25 องศาเซลเซียส) ได้นานประมาณ 30 วัน อินซูลินที่เก็บในอุณหภูมิสูง เช่น กลางแดดจัด หรือที่อุณหภูมิต่ำมากๆ เช่น ในช่องแช่แข็งของตู้เย็น ไม่ควรใช้เป็นอย่างยิ่งเนื่องจากยาเสื่อมคุณภาพ และไม่แนะนำเก็บที่ฝาตู้เย็น เนื่องจาก อาจทำให้อุณหภูมิไม่ค่อยคงที่จากการปิด-เปิดตู้เย็น"),
            FootCareTxt1(
                "  - อินซูลินที่เปิดใช้แล้วและเก็บอยู่ในปากกาฉีดอินซูลิน สามารถเก็บที่อุณหภูมิห้อง (25 องศาเซลเซียส) ได้นานประมาณ 30 วัน"),
          ],
        ),
      ),
    );
  }
}
