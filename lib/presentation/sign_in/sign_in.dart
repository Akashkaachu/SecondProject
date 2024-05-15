import 'package:adamsdoc/core/constants/colors.dart';
import 'package:adamsdoc/core/constants/sized_box.dart';
import 'package:adamsdoc/domain/widgets/text_field.dart';
import 'package:adamsdoc/utility/refactor_widgets.dart';
import 'package:adamsdoc/utility/text_formfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  TextEditingController userNameController = TextEditingController();
  TextEditingController passWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Stack(
                children: [
                  Container(
                    width: size.width * 0.5,
                    height: size.height * 0.14,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/logos/adamsdoc.png'),
                            fit: BoxFit.fitWidth)),
                  ),
                  Positioned(
                      bottom: 0,
                      child: Container(
                          color: kWhite,
                          width: size.width * 0.5,
                          child: const Align(child: AdamsDocText())))
                ],
              ),
            ),
            kHeight10,
            TextWidget(
              text: 'Welcome Back!',
              textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w500),
            ),
            kHeight20,
            TextFieldClass().buildUserNameField(context, userNameController),
            kHeight10,
            TextFieldClass().buildPasswordField(context, passWordController),
            kHeight10,
            const GestureDetectorWidget(
                text: 'Forgot password?',
                color: kSecondaryColor,
                fontWeight: FontWeight.w500),
            kHeight15,
            SizedBox(
                width: size.width,
                child: ElevetedButtonWidget(
                  onPressed: () {},
                  text: 'Log In',
                  color: kDocColor,
                  textColor: kWhite,
                  outlineColor: kWhite,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                )),
            kHeight50,
            const Divider(
              color: kGrey,
              thickness: 1,
            ),
            kHeight20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SocialMediaShapeContainer(
                  size: size,
                  onDoubleTap: () {},
                  image: 'assets/images/logos/google.png',
                ),
                kWidth10,
                SocialMediaShapeContainer(
                  size: size,
                  onDoubleTap: () {},
                  image: 'assets/images/logos/facebook.png',
                ),
                kWidth10,
                SocialMediaShapeContainer(
                  size: size,
                  onDoubleTap: () {},
                  image: 'assets/images/logos/email.png',
                ),
              ],
            ),
            kHeight40,
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have and account?"),
                GestureDetectorWidget(
                    text: 'Sign Up',
                    color: kSecondaryColor,
                    fontWeight: FontWeight.w500)
              ],
            )
          ]),
        )),
      ),
    );
  }
}

class SocialMediaShapeContainer extends StatelessWidget {
  const SocialMediaShapeContainer({
    super.key,
    required this.size,
    required this.image,
    required this.onDoubleTap,
  });

  final Size size;
  final String image;
  final void Function()? onDoubleTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: onDoubleTap,
      child: Container(
        width: size.width * 0.15,
        height: size.height * 0.09,
        decoration: BoxDecoration(
            color: kfafafa,
            shape: BoxShape.circle,
            image: DecorationImage(image: AssetImage(image))),
      ),
    );
  }
}

class GestureDetectorWidget extends StatelessWidget {
  const GestureDetectorWidget({
    super.key,
    required this.text,
    required this.color,
    required this.fontWeight,
  });
  final String text;
  final Color color;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              text,
              style: GoogleFonts.poppins(color: color, fontWeight: fontWeight),
            )));
  }
}
