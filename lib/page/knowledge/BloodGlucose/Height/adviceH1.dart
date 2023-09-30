import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/components/bloodGlucose/adviceHeightBoxTxt4.dart';

class AdviceH1 extends StatelessWidget {
  const AdviceH1({super.key});

  @override
  Widget build(BuildContext context) {
    return AdviceHeightBoxTxt4(
        "การปฎิบัติตัวเบื่องต้น",
        "- ดื่มน้ำสะอาดมากๆ",
        "- หยุดทำกิจกรรมแล้วพักผ่อน",
        "- หากอาการดีขึ้นแล้ว ควรตรวจเลือด และ ปัสสาวะซ้ำทุก 4 ชม. รวมถึงดื่มน้ำสะอาดเยอะๆ",
        "- หากมาอาการชักกระตุกเฉพาะที่ หรือมีอาการซึมและมีระดับน้ำตาลในเลือดมากให้พบแพทย์ทันที ",
        Colors.blue,
        320);
  }
}
