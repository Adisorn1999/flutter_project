import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../components/foodCare/foodCareTxt1.dart';
import '../../../components/foodCare/foodcaretxt1_blue.dart';

class Smoking extends StatelessWidget {
  const Smoking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "เบาหวานกับการสูบบุหรี่",
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
            FootCareTxt1(
                "ผู้ที่เป็นเบาหวาน จะส่งผลเสี่ยต่อร่างกาย เพราะการสูบบุหรี่นั้นจะทำให้ระดับน้ำตาลในเลือดเพิ่มสูงขึ้น ทำให้ควบคุมเบาหวานได้ยากขึ้น สาเหตุจากนิโคตินและสารเสพติดอื่นๆ ในควันบุหรี่จะขัดขวางการออกฤทธิ์ของอินซูลินในร่างกาย การสูบบุหรี่เป็นตัวเร่งสำคัญของการเกิดโรคแทรกซ้อนต่างๆ ในคนที่เป็นเบาหวานได้แก่ โรคหัวใจ ไตเสื่อม และเบาหวานขึ้นตา เพิ่มโอกาศที่จะต้องถูกตัดขาดเลือดไปเลี้ยง"),

            const SizedBox(
              height: 10,
            ),
            FootCareTxt1(
                "นิโคตินจากควันบุหรี่ทำให้หวัใจเต๊นเร้วขึ้น ออกซิเจนในเลือดลดลง ทำให้หัวใจต้องทำงานหนักขึ้น ถ้าเป้นเบาหวานและสูบบุหรี่ มีโอกาศจะเสียชีวิตจากโรคหัวใจวายกระทันหัน"),

            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
