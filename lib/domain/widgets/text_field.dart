import 'package:adamsdoc/core/constants/colors.dart';
import 'package:adamsdoc/core/constants/sized_box.dart';
import 'package:adamsdoc/domain/provider/provider.dart';
import 'package:adamsdoc/domain/widgets/widgets.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TextFieldClass {
  Widget buildEmailField(
      BuildContext context, TextEditingController controller) {
    return Consumer<SignUpProviderModel>(
      builder: (context, model, child) => TextFormFieldWidget(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        label: 'Email',
        icon: Icons.email,
        suffixIcon: model.isEmailValid == null
            ? null
            : model.isEmailValid == false
                ? Icons.cancel
                : Icons.check_circle,
        suffixIconColor: model.isEmailValid == null
            ? null
            : model.isEmailValid == false
                ? kRed
                : kGreen,
        hintText: 'Eg. example@gmail.com',
        onChanged: (value) => model.validateEmail(value),
        validator: (value) {
          if (value!.trim().isEmpty) {
            return 'Please Enter the E-mail';
          } else if (EmailValidator.validate(value)) {
            return null;
          } else {
            return 'E-mail is Not valid';
          }
        },
      ),
    );
  }

  Widget buildPasswordForSignUpField(
      BuildContext context, TextEditingController controller) {
    return Consumer<SignUpProviderModel>(
      builder: (context, model, child) => TextFormFieldWidget(
        controller: controller,
        keyboardType: TextInputType.visiblePassword,
        label: 'Password',
        icon: Icons.fingerprint,
        suffixIcon: model.isPasswordValid == null
            ? null
            : model.isPasswordValid == false
                ? Icons.cancel
                : Icons.check_circle,
        suffixIconColor: model.isPasswordValid == null
            ? null
            : model.isPasswordValid == false
                ? kRed
                : kGreen,
        hintText: "Eg. Adam@123",
        validator: (value) {
          if (RegExp(
                  r'^(?=.?[a-z])(?=.?[A-Z])(?=.?[0-9])(?=.?[!@#\$&*~]).{8,}$')
              .hasMatch(value!.trim())) {
            return null;
          } else if (value.isEmpty) {
            return 'Please Enter the password';
          } else {
            return 'Please Enter the Strong password';
          }
        },
        onChanged: (value) => model.validatePassword(value),
      ),
    );
  }

  Widget buildUserNameField(
    BuildContext context,
    TextEditingController firstNamecontroller,
    // TextEditingController lastNamecontroller,
  ) {
    final size = MediaQuery.of(context).size;
    return Consumer<SignUpProviderModel>(
      builder: (context, model, child) => SizedBox(
        // width: size.width / 2 - 16,
        child: TextFormFieldWidget(
          controller: firstNamecontroller,
          label: 'Username',
          icon: Icons.person,
          suffixIcon: model.isFirstNameValid == null
              ? null
              : model.isFirstNameValid == false
                  ? Icons.cancel
                  : Icons.check_circle,
          suffixIconColor: model.isFirstNameValid == null
              ? null
              : model.isFirstNameValid == false
                  ? kRed
                  : kGreen,
          hintText: "Varun",
          onChanged: (value) => model.validateFirstName(value),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please Enter the Name';
            } else if (value.isNotEmpty &&
                !value.contains(RegExp(r'[0-9]')) &&
                !value.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]')) &&
                value.length > 3) {
              return null;
            } else {
              return 'Please Enter the valid name';
            }
          },
        ),
      ),
    );
  }

  Widget buildPhoneField(
      BuildContext context, TextEditingController controller) {
    return Consumer<SignUpProviderModel>(
      builder: (context, model, child) => TextFormFieldWidget(
        controller: controller,
        keyboardType: TextInputType.phone,
        label: 'Phone Number',
        icon: Icons.phone,
        suffixIcon: model.isPhoneNumValid == null
            ? null
            : model.isPhoneNumValid == false
                ? Icons.cancel
                : Icons.check_circle,
        suffixIconColor: model.isPhoneNumValid == null
            ? null
            : model.isPhoneNumValid == false
                ? kRed
                : kGreen,
        hintText: "Eg. 9123986562",
        onChanged: (value) => model.validatePhoneNumber(value),
        validator: (value) {
          RegExp phoneNumberRegex = RegExp(r'^[0-9]{10}$');

          if (phoneNumberRegex.hasMatch(value!.trim())) {
            return null;
          } else if (value.isEmpty) {
            return 'Please Enter the Phone No';
          } else {
            return 'Invalid Number';
          }
        },
      ),
    );
  }

  Widget buildAddressField(
      BuildContext context, TextEditingController controller) {
    return Consumer<SignUpProviderModel>(
      builder: (context, model, child) => TextFormFieldWidget(
        maxLines: 5,
        label: 'Address',
        controller: controller,
        icon: Icons.mark_as_unread_sharp,
        suffixIcon: model.isAddressValid == null
            ? null
            : model.isAddressValid == false
                ? Icons.cancel
                : Icons.check_circle,
        suffixIconColor: model.isAddressValid == null
            ? null
            : model.isAddressValid == false
                ? kRed
                : kGreen,
        onChanged: (value) => model.validateAddress(value),
        validator: (value) {
          if (value!.trim().length > 6 &&
              !value.contains(RegExp(r'[!@#\$%^&*().?":{}|<>]'))) {
            return null;
          } else if (value.isEmpty) {
            return 'Please enter the address';
          } else {
            return 'Enter valid Address';
          }
        },
      ),
    );
  }

  Widget buildDOBField(
      BuildContext context, TextEditingController dateEditingConntroller) {
    return Consumer<SignUpProviderModel>(
      builder: (context, model, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kHeight15,
          const Text(
            'DOB',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          kHeight10,
          TextFormField(
              initialValue: null,
              readOnly: true,
              controller: dateEditingConntroller,
              decoration: InputDecoration(
                filled: true,
                suffixIcon: model.isDobValid == null
                    ? null
                    : model.isDobValid == false
                        ? const Icon(
                            Icons.cancel,
                            color: kRed,
                          )
                        : const Icon(
                            Icons.check_circle,
                            color: kGreen,
                          ),
                fillColor: kWhite,
                prefixIcon: const Icon(Icons.calendar_month),
                labelText: 'DOB',
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: kPrimaryColor,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
              onTap: () async {
                var date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100));
                if (date != null) {
                  dateEditingConntroller.text =
                      DateFormat('dd MMM yyyy').format(date);
                }
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Select DOB";
                } else {
                  return null;
                }
              },
              onChanged: (value) =>
                  model.validateDoB(dateEditingConntroller.text)),
        ],
      ),
    );
  }

  Widget buildGenderField(
      BuildContext context, TextEditingController controller) {
    return Consumer<GenderProvider>(
      builder: (context, model, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kHeight10,
          const Text(
            'Gender',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          kHeight10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Radio(
                value: Gender.male,
                groupValue: model.selectedGender,
                onChanged: (value) {
                  model.setSelectedGender(value!, controller);
                },
              ),
              const Text('Male'),
              Radio(
                value: Gender.female,
                groupValue: model.selectedGender,
                onChanged: (value) {
                  model.setSelectedGender(value!, controller);
                },
              ),
              const Text('Female'),
              Radio(
                value: Gender.other,
                groupValue: model.selectedGender,
                onChanged: (value) {
                  model.setSelectedGender(value!, controller);
                },
              ),
              const Text('Other'),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPasswordField(
      BuildContext context, TextEditingController controller) {
    return ChangeNotifierProvider(
      create: (_) => SignUpProviderModel(),
      child: Consumer<SignUpProviderModel>(
        builder: (context, passwordProvider, child) {
          return TextFormField(
            controller: controller,
            obscureText: passwordProvider.isPasswordObscured,
            decoration: InputDecoration(
              label: Text(
                'Password',
                style: GoogleFonts.poppins(color: kDocColor),
              ),
              prefixIcon: Icon(
                Icons.key,
                color: kAdamsColor,
              ),
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(
                  passwordProvider.isPasswordObscured
                      ? Icons.visibility_off_outlined
                      : Icons.visibility,
                ),
                onPressed: () {
                  passwordProvider.togglePasswordVisibility();
                },
              ),
              hintText: "Password",
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  borderSide: BorderSide(color: kAdamsColor)),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter your Password";
              } else if (value.length < 6) {
                return "Enter at least 6 strong password";
              } else {
                return null;
              }
            },
          );
        },
      ),
    );
  }
}
