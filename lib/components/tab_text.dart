import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabBarText extends StatelessWidget {
  final String text;
  const TabBarText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          textStyle: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
    );
  }
}
