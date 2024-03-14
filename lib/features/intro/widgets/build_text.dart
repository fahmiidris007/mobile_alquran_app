import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;

  const BuildText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: Colors.white,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
      textAlign: TextAlign.center,
    );
  }
}
