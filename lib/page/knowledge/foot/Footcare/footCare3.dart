import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../components/foodCare/foodCareTxt1.dart';
import '../FoodExercises/footExercises.dart';

class FootCare3 extends StatelessWidget {
  const FootCare3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "วิธีการดูแลเท้า",
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const SizedBox(
              height: 10,
            ),
            FootCareTxt1(
                "  10.เมื่อมีบาดแผล ควรทำความสะอาดแผลด้วยน้ำเกลือล้างแผล ห้ามใช้ทิงเจอร์ไอโอดีน หรือไฮโดรเจนเปอร์ออกไซด์ ถ้าแผลมีการอักเสบสังเกตได้จากมีอาการปวดบวม แดงมากขึ้น มีหนองที่แผล ต้องรีบปรึกษาแพทย์"),
            const SizedBox(
              height: 5,
            ),
            FootCareTxt1(
                "  11.งดการสูบบุหรี่ เนื่องจากมีผลให้หลอดเลือดตีบแข็ง อาจขาดเลือดมาเลี้ยงทำให้เกิดแผลจากเนื้อตาย หรือถ้ามีแผลติดเชื้อทำให้เม็ดเลือดขาวเข้ามากินเชื้อได้น้อย การหายช้า ทำให้แผลลาม"),
            const SizedBox(
              height: 5,
            ),
            FootCareTxt1(
                "  12.การบริหารเท้าทุกวัน ช่วยทำให้การหมุนเวียนของเลือดที่เท้าดีขึ้น โดยบริหารดังนี้"),
            const SizedBox(
              height: 5,
            ),
            FootCareTxt1(
                "  บริหารขาในท่าแกว่งเท้า ให้ยืนเกาะขอบโต๊ะ แกว่งเท้าไปมา ไม่งอขาขณะแกว่งในด้านหน้า ให้เกร็งยกขาสูงขึ้นจากส้นนับ 1-10 แล้วจึงแกว่งไปด้านหลัง ทำทีละข้างๆ ละ 10 ครั้ง"),
            const SizedBox(
              height: 5,
            ),
            FootCareTxt1(
                "  บริหารน่อง นั่งเก้าอี้หลังตรง ยกปลายเท้าสูงจากพื้น 1 ฟุต เกร็งปลายเท้าให้ชี้เข้าหาตัว ส้นเท้าเหยียดออกจนรู้สึกน่องตึง นับ 1-10 แล้วคลายกล้ามเนื้อที่น่องทำ 10 ครั้งสลับข้าง"),
            const SizedBox(
              height: 5,
            ),
            FootCareTxt1(
                "  เพียงเท่านี้ก็จะช่วยให้ผู้ป่วยเบาหวานมีสุขภาพเท้าที่ดี และห่างไกลปัจจัยเสี่ยงต่างๆ ที่จะทำให้เกิดแผลที่เท้าและไม่ลุกลามจนต้องถูกตัดขาในที่สุด"),
          ],
        ),
      ),
    );
  }
}
