import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UnderConstruction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
              color: Color.fromRGBO(0, 30, 70, 1),
              child: Container(
                height: 250,
                width: double.infinity,
                child: Center(
                  child: Text(
                    "Under Construction",
                    style: GoogleFonts.fredokaOne(color: Colors.yellow,fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
    );
  }
}