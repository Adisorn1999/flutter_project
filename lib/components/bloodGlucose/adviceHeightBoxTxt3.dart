// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class AdviceHeightBoxTxt3 extends StatelessWidget {
  String title;
  String txt1;
  String txt2;
  String txt3;
  Color color;
  double size;
  AdviceHeightBoxTxt3(
      this.title, this.txt1, this.txt2, this.txt3, this.color, this.size);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title,
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: size,
                width: double.infinity,
                color: color,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        txt1,
                        style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xffffffff)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        txt2,
                        style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xffffffff)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        txt3,
                        style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xffffffff)),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
