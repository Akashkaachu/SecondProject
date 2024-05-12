import 'package:adamsdoc/core/colors.dart';
import 'package:adamsdoc/presentation/dash_board/dash_board_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Second Project',
      theme: ThemeData(
          textTheme: TextTheme(
              bodySmall: GoogleFonts.poppins(
                  color: kWhite, fontSize: 15, fontWeight: FontWeight.normal),
              bodyMedium: GoogleFonts.poppins(
                  color: kWhite, fontSize: 26, fontWeight: FontWeight.w700),
              bodyLarge: GoogleFonts.poppins(
                  color: kWhite, fontSize: 30, fontWeight: FontWeight.w700),
              titleSmall: GoogleFonts.poppins(
                  color: kWhite, fontSize: 20, fontWeight: FontWeight.normal))),
      debugShowCheckedModeBanner: false,
      home: const DashboardPage(),
    );
  }
}
