import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/components/bloodGlucose/adviceHeightBoxTxt4.dart';

class AdviceH4 extends StatelessWidget {
  const AdviceH4({super.key});

  @override
  Widget build(BuildContext context) {
    return AdviceHeightBoxTxt4(
        "ป้องกันภาวะน้ำตาลในเลือดสูงได้อย่างไร",
        "- ควบคุมเบาหวานให้ดี โดยปฏิบัติตามคำแนะนำของแพทย์อย่างเคร่งครัด ทั้งด้านควบคุมอาหาร การออกกำลังกาน การรับประทานยา",
        "- ตรวจระดับน้ำตาลในเลือด และปัสสาวะอย่างสม่ำเสมอ",
        "- กรณีไม่สบายควรไปพบแพทย์ ไม่ควรซื้อยารับประทานเอง และควรบอกแพทย์ว่าเป็นเบาหวาน",
        "- อย่าหยุดฉีดยา หรือรับประทานยา แม้ว่าจนะรับประทานอาหารได้น้อย",
        Colors.blue,
        350);
  }
}
