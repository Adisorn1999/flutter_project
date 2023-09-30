import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/page/knowledge/smoking/effect_smoking/effect_short.dart';
import 'package:flutter_application/page/knowledge/smoking/quitSmoking.dart';
import 'package:flutter_application/page/knowledge/smoking/smoking.dart';
import 'package:google_fonts/google_fonts.dart';

class SmokingHome extends StatelessWidget {
  const SmokingHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("การสูบบุหรี่",
            style:
                GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            // ignore: avoid_unnecessary_containers
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                    height: 65,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xcc5286d4))),
                        child: Text('เบาหวานกับการสูบบุหรี่',
                            style: GoogleFonts.roboto(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Smoking()));
                        })),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                    height: 65,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xcc5286d4))),
                        child: Text('ผลกระทบของการสูบบุหรี่',
                            style: GoogleFonts.roboto(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const EffectSmokingShort()));
                        })),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                    height: 65,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xcc5286d4))),
                        child: Text('ข้อดีของการเลิกบุหรี่',
                            style: GoogleFonts.roboto(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const QuitSmoking()));
                        })),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
