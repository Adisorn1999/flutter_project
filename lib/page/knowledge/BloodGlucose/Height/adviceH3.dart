import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/components/bloodGlucose/adviceHeightBoxTxt3.dart';

class AdviceH3 extends StatelessWidget {
  const AdviceH3({super.key});

  @override
  Widget build(BuildContext context) {
    return AdviceHeightBoxTxt3(
        "สาเหตุของการเกิดน้ำตาลในเลือดสูง",
        "- คุมเบาหวานได้ไม่ดี รับประทานอาหารมาก เกินไป ขาดการออกกำลังกาาย รับประทานยา หรือฉีดอินซูลีนไม่สม่ำเสมอ",
        "- การเจ็บป่วยที่รุนแรง เช่นกล้ามเนื้อหัวใจขาดเลือด หรือมีภาวะติดเชื้อ",
        "- ได้รับยาต้านอินซูลีน เช่น สเตียรอยด์ ยาขับปัสสาวะ",
        Colors.blue,
        175);
  }
}
