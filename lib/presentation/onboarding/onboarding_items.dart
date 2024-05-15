import 'package:adamsdoc/core/constants/colors.dart';
import 'package:adamsdoc/presentation/onboarding/onboarding_info.dart';

class OnboardingItems {
  List<OnboardingInfo> items = [
    OnboardingInfo(
        title: 'Laboratory',
        titleColor: kDocColor,
        descriptions:
            "A scientist in his laboratory is not a mere technician: he is also a child confronting natural phenomena that impress him as though they were fairy tales.",
        image: "assets/gif/Retroviruses.gif"),
    OnboardingInfo(
        title: "Diagnosis",
        titleColor: kDocColor,
        descriptions:
            "There is little you can do to stop a tornado, a hurricane, or a cancer diagnosis from changing your life in an instant.",
        image: "assets/gif/diagnosis.gif"),
    OnboardingInfo(
        title: "Chronic Diseases",
        titleColor: kDocColor,
        descriptions:
            "Cancer taught my family that my mom is much stronger than we ever thought.",
        image: "assets/gif/Virus.gif"),
    OnboardingInfo(
        title: "Heart Diseases",
        titleColor: kDocColor,
        descriptions:
            "A healthy heart is a key to happiness in life so put a stop to all of the problems related to your heart before it stops you.",
        image: "assets/gif/Cardiologist.gif"),
  ];
}
