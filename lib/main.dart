import 'package:adamsdoc/core/constants/colors.dart';
import 'package:adamsdoc/domain/provider/provider.dart';
import 'package:adamsdoc/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignUpProviderModel()),
        ChangeNotifierProvider(create: (_) => GenderProvider()),
      ],
      child: MaterialApp(
        title: "Adam's Doc",
        theme: ThemeData(scaffoldBackgroundColor: kPrimaryColor),
        debugShowCheckedModeBanner: false,
        //darkTheme: ThemeClass.darkTheme.copyWith(textTheme: textTheme),
        themeMode: ThemeMode.system,
        home: const SplashScrn(),
      ),
    );
  }
}
