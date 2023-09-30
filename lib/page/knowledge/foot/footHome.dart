import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'FoodExercises/footExercises.dart';
import 'Footcare/footCare1.dart';
import 'package:google_fonts/google_fonts.dart';

class FootHome extends StatelessWidget {
  const FootHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("การดูแลเท้า",
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
                        child: Text('การดูแลเท้า',
                            style: GoogleFonts.roboto(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const FootCare1()));
                        })),
              ),
            ),
            const SizedBox(
              height: 40,
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
                        child: Text('การบริการเท้า',
                            style: GoogleFonts.roboto(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const FootExercises()));
                        })),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
