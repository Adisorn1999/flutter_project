import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/components/foodCare/foodcaretxt1_blue.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../components/foodCare/foodCareTxt1.dart';

class EffectSmokingLong extends StatelessWidget {
  const EffectSmokingLong({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ผลกระทบของการสูบบุหรี่",
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
            FootCareTxt1Blue("ผบกระทบระยะยาว"),
            FootCareTxt1("เป็นสาเหตุการเกิดโรคต่างๆ ได้แก่"),
            FootCareTxt1(
                " - โรคมะเร็งปอด และมะเร็งในส่วนต่างๆ ของร่างกายเช่น กล่องเสี่ยง ลำคอ หลอดอาหาร และกระเพาะปัสสาวะ"),
            FootCareTxt1(
                " - โรคเส้นเลือดหัวใจตีบ และดรคหัวใจขาดเลือด มีความเสี่ยงต่อการเกิดอาการหัวใจวาย"),
            FootCareTxt1(
                " - โรคหลอดเลือดสมอง หลอดเลือดส่วนอื่นๆ ตึบตัน และหลอดเลือดใหญ่ทรวงอก และช่องท้องโป่งพอง"),
            FootCareTxt1(" - โรคถุงลมโป่งพอง โรคหลอดลม อักเสบรื้อรัง"),
            FootCareTxt1("- มีกรดในกระเพาะอาหารมากขึ้น"),
            FootCareTxt1(" - เกิดกลิ้นเหม็นตามร่างกายและเสื้อผ้า"),
            FootCareTxt1(
                " - ทำให้สมรรถภาพทางเพศเสื่อม จากการอุดตันของเส้นเลือดขนาดเล็ก ที่ไปเลี้ยงประสาท ที่เกี่ยวกับการควบคุมการเเข็งตัวของอวัยวะเพศ"),
            FootCareTxt1(
                " - เกิดอาการเส้นเลือดที่ไปเลี้ยงแขนและขาตึบตัน อาจต้องตัดแขนหรือขาทิ้ง"),

            const SizedBox(
              height: 10,
            ),

            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
