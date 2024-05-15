import 'package:adamsdoc/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget(
      {super.key,
      this.keyboardType,
      this.onChanged,
      this.obscureText = false,
      this.controller,
      this.suffixIcon,
      this.fillColor,
      this.onPressed,
      this.suffixIconColor,
      this.icon,
      required this.label,
      this.hintText,
      this.validator,
      this.maxLines});
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final bool obscureText;
  final TextEditingController? controller;
  final int? maxLines;
  final IconData? suffixIcon;
  final Color? fillColor;
  final void Function()? onPressed;
  final Color? suffixIconColor;
  final IconData? icon;
  final String label;
  final String? hintText;

  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      onChanged: onChanged,
      obscureText: obscureText,
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      decoration: InputDecoration(
        focusColor: kDocColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        fillColor: fillColor,
        suffixIcon: IconButton(
            onPressed: onPressed,
            icon: Icon(
              suffixIcon,
              color: suffixIconColor,
            )),
        prefixIcon: Icon(
          icon,
          color: kAdamsColor,
        ),
        label: Text(
          label,
          style: GoogleFonts.poppins(color: kDocColor),
        ),
        hintText: hintText,
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            borderSide: BorderSide(color: kAdamsColor)),
      ),
    );
  }
}
