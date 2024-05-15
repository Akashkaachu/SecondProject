import 'package:adamsdoc/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdamsDocText extends StatelessWidget {
  const AdamsDocText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
        text: "Adam's",
        style: GoogleFonts.shareTechMono(
            fontSize: 30, fontWeight: FontWeight.bold, color: kAdamsColor),
        children: const [
          TextSpan(
              text: " Doc",
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, color: kDocColor),
              children: [])
        ]));
  }
}
//============================================================================

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    this.text,
    this.fontWeight,
    this.fontSize,
    this.color,
    this.textStyle,
  });
  final String? text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: GoogleFonts.poppins(
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: color,
          textStyle: textStyle),
    );
  }
}
