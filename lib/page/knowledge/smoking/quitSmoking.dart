import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/foodCare/foodCareTxt1.dart';

class QuitSmoking extends StatelessWidget {
  const QuitSmoking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ข้อดีของการเลิกบุหรี่",
            style:
                GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold)),
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
            FootCareTxt1(" - จะคุมระดับน้ำตาลได้ง่ายขึ้น"),
            FootCareTxt1(
                " - ลดดดอกาศและชะลอการเกิดโรคแทรกซ้อนต่างๆ จากเบาหวาน"),
            FootCareTxt1(
                " - ความเสี่ยงของการเกิดโรคอื่นๆ ที่เกิดจากการสูบบุหรี่ เช่น มะเร็งปอด มะเร็งที่อื่นๆ ถุงลมปอดพอง"),
            FootCareTxt1(" - รู้สึกดีขึ้น เหนื่อยน้อยลง ไอน้อยลง"),
            FootCareTxt1(" - ดูดีขึ้น หน้าตาสดใสขึ้น ตัวไม่เห็นบุหรี่"),
            FootCareTxt1(" - ทานอาหารได้อร่อยขึ้น"),
            FootCareTxt1(" - ประหยัดเงินค่าบุหรี่"),
            FootCareTxt1(" - มีอายุยื้นขึ้น"),
          ],
        ),
      ),
    );
  }
}
