// ignore_for_file: use_build_context_synchronously

import 'package:adamsdoc/core/constants/colors.dart';
import 'package:adamsdoc/core/constants/sized_box.dart';
import 'package:adamsdoc/presentation/onboarding/onboarding_view.dart';
import 'package:adamsdoc/utility/refactor_widgets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScrn extends StatefulWidget {
  const SplashScrn({super.key});

  @override
  State<SplashScrn> createState() => _SplashScrnState();
}

bool userlogged = false;

class _SplashScrnState extends State<SplashScrn> {
  @override
  void initState() {
    //  getSharedPreferenceData();
    splashTime(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBlack,
      body: SingleChildScrollView(
        child: Column(children: [
          kHeight80,
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.1),
            child: SizedBox(
                width: size.width,
                height: size.height / 2,
                child: Lottie.asset(
                    "assets/animations/Animation - 1715541264874.json",
                    width: size.width / 2,
                    height: size.height / 2)),
          ),
          const AdamsDocText(),
        ]),
      ),
    );
  }

  void splashTime(BuildContext contex) async {
    await Future.delayed(const Duration(milliseconds: 3500));

    Navigator.of(contex).pushReplacement(MaterialPageRoute(
      builder: (context) => userlogged ? Container() : const OnboardingView(),
    ));
  }

  // void getSharedPreferenceData() async {
  //   await SharedPreferenceClass.getUserLoggedIn().then((value) {
  //     if (value != null) {
  //       setState(() {
  //         userlogged = value;
  //       });
  //     }
  //   });
  // }
}
