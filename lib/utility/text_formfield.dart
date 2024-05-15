import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ElevetedButtonWidget extends StatelessWidget {
  const ElevetedButtonWidget({
    super.key,
    required this.text,
    required this.color,
    this.leading,
    required this.onPressed,
    required this.outlineColor,
    required this.textColor,
    this.fontSize,
    this.fontWeight,
    this.width,
  });
  final String text;
  final Color color;
  final Color outlineColor;
  final Color textColor;
  final Widget? leading;
  final void Function()? onPressed;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(color),
        side: MaterialStateProperty.resolveWith<BorderSide>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return const BorderSide(color: Colors.grey);
            }
            return BorderSide(color: outlineColor);
          },
        ),
      ),
      onPressed: onPressed,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        leading ?? Container(),
        SizedBox(
          width: width,
        ),
        Text(
          text,
          style: GoogleFonts.poppins(
              color: textColor, fontSize: fontSize, fontWeight: fontWeight),
        )
      ]),
    );
  }
}
