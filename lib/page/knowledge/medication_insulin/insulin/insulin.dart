import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../components/foodCare/foodCareTxt1.dart';
import '../../../../components/foodCare/foodcaretxt1_blue.dart';
import '../effect/effect_insulin/effect_insulin.dart';

class Insulin extends StatelessWidget {
  const Insulin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ยาฉีดอินซูลีน",
            style:
                GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              // ignore: sized_box_for_whitespace
              const SizedBox(
                height: 10,
              ),
              FootCareTxt1Blue(" ข้อบ่งชี้ "),
              FootCareTxt1(
                  " -ผู้ป่วยเบาหวานที่ตับอ่อนสร้างอืนซูลินไม่เพียงพอกับความต้องการของร่างการ"),
              FootCareTxt1(
                  " -ผู้ป่วยเบาหวานที่มีดรคแทรกซ้อนทางตับ ไต และรักษาโดยยาชนิดรับประทานไม่ได้ผล"),
              const SizedBox(
                height: 10,
              ),
              FootCareTxt1Blue(" กลไกลการออกฤิทธิ์ "),

              FootCareTxt1(
                  " - อินซูลินแบ่งออกเป็นหลายชนิด ตามระยะเวลาที่ออกฤทธิ์ "),
              const SizedBox(
                height: 10,
              ),
              FootCareTxt1(
                  " 1. อินซูลินที่ออกฤทธิ์เร็ว (Rapid-acting insulin): โดยจะเริ่มออกฤทธิ์ภายใน 15-30 นาทีหลังฉีด มักใช้ฉีดก่อนมื้ออาหารหรือหลังมื้ออาหารไม่เกิน 15 นาที"),

              FootCareTxt1(
                  " 2. อินซูลินที่ออกฤทธิ์สั้น (Short-acting insulin): โดยจะเริ่มออกฤทธิ์ภายใน 30-60 นาทีหลังฉีด และมีระยะเวลาที่ยาออกฤทธิ์ได้ทั้งหมด 5-8 ชั่วโมง"),

              FootCareTxt1(
                  " 3. อินซูลินที่ออกฤทธิ์นานปานกลาง (Intermediate-acting insulin): โดยจะเริ่มออกฤทธิ์ภายใน 1-2 ชั่วโมงหลังฉีด และมีระยะเวลาที่ยาออกฤทธิ์ได้ทั้งหมด 14-16 ชั่วโมง"),

              FootCareTxt1(
                  " 4. อินซูลินที่ออกฤทธิ์ยาว (Long-acting insulin): โดยจะเริ่มออกฤทธิ์หลังจากฉีดไปแล้ว 2 ชั่วโมง และมีระยะเวลาที่ยาออกฤทธิ์ได้อย่างน้อย 24 ชั่วโมง"),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const EffectInsulin()));
                },
                child: const Text(
                  'ผลข้างเคียงจากการใช้ยา อ่านต่อ',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
