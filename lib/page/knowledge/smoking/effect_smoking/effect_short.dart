import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../components/foodCare/foodCareTxt1.dart';
import '../../../../components/foodCare/foodcaretxt1_blue.dart';
import 'effect_long.dart';

class EffectSmokingShort extends StatelessWidget {
  const EffectSmokingShort({super.key});

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
            FootCareTxt1Blue("ผลกระทบระยะสั้น"),
            FootCareTxt1(
                " - ประสาทสัมผัสของการรับรู้กลิ้นและรส จะทำหน้าที่ได้ลดลง"),
            FootCareTxt1(" - แสบตา น้ำตาไหล"),
            FootCareTxt1(
                " - ขนอ่อนที่ทำหน้าที่พัดดบก เพื่อกำจัดสิ่งแปลกปลอมภายในหลอดลมเป็นอัมพาต หรือทำงานได้ช้าลง"),
            FootCareTxt1(
                " - ระดับคาร์บอนมอนอกไซด์ในปอดลดลง และในกระแสเลือดเพิ่มขึ้น"),
            FootCareTxt1(" - หัวใจเต๊นเร็ว และความดันดลหิตสูงขึ้น"),
            FootCareTxt1("- มีกรดในกระเพาะอาหารมากขึ้น"),
            FootCareTxt1(" - เกิดกลิ้นเหม็นตามร่างกายและเสื้อผ้า"),
            FootCareTxt1(" - ประหยัดเงินค่าบุหรี่"),
            FootCareTxt1("ริมฝีปากดำ ลมหายใจมีกลิ้นเหม็น และมีกลิ้นปาก"),

            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const EffectSmokingLong()));
              },
              child: const Text(
                'ผบกระทบระยะยาว อ่านต่อ',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
