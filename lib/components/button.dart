import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final String text;
  const MyButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 80,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Color(0xff19202D),
          borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(60), top: Radius.circular(10)),
        ),
        child: Text(
          text,
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24)),
        ));
  }
}
