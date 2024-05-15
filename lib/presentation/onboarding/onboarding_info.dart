import 'dart:ui';

import 'package:adamsdoc/core/constants/colors.dart';

class OnboardingInfo {
  final String title;
  final Color titleColor;
  final String descriptions;
  final String image;

  OnboardingInfo(
      {required this.title,
      this.titleColor = kAdamsColor,
      required this.descriptions,
      required this.image});
}
