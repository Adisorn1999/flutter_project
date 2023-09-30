import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class FootCareTxtB1 extends StatelessWidget {
  String text;
  FootCareTxtB1(this.text, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: prefer_const_constructors
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text,
              style: GoogleFonts.roboto(
                  fontSize: 18, fontWeight: FontWeight.bold))),
    );
  }
}
