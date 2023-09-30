import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/components/foodCare/foodCareTxt1.dart';
import 'package:google_fonts/google_fonts.dart';

class Activity5 extends StatelessWidget {
  const Activity5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("การเดินช่วยลดน้ำหนักได้",
            style:
                GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold)),
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
                "  การเดินออกกำลังกายเป็นประจำ มีส่วนช่วยในการเผาผลาญพลังงานแคลอรี่ในแต่ละวัน นอกจากนี้การออกกำลังกายเป็นประจำยังมีส่วนช่วยสร้างกล้ามเนื้อได้มากขึ้นอีกด้วย นอกจากนี้หากมีการออกกำลังกาย ในระดับปานกลางอย่างสม่ำเสมอเช่น การเดิน ว่ายน้ำ สามารถช่วยทำให้คุณมีอารมณ์ที่ดีอย่างคงที่ในระยะยาวอีกด้วย โดยจากการตรวจสอบแล้วเพื่อรักษาน้ำหนักให้คงที่ ควรเดินอย่างน้อย 150 นาทีต่อสัปดาห์"),
          ],
        ),
      ),
    );
  }
}
