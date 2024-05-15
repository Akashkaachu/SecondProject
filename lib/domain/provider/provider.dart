import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class SignUpProviderModel with ChangeNotifier {
  bool? _isFirstNameValid;
  bool? _isPasswordValid;
  bool? _isEmailValid;
  bool? _isDobValid;
  bool? _isPhoneNumValid;
  bool? _isAgeValid;
  bool? _isAddressValid;
  bool? _isBloodGroupValid;
  bool? _isGenderValid;
  bool? _isHeightValid;
  bool? _isWeightValid;
  bool? _isEmergencyNumberValid;
  bool _isPasswordObscured = true;

  bool? get isFirstNameValid => _isFirstNameValid;
  bool? get isPasswordValid => _isPasswordValid;
  bool? get isEmailValid => _isEmailValid;
  bool? get isPhoneNumValid => _isPhoneNumValid;
  bool? get isAddressValid => _isAddressValid;
  bool? get isAgeValid => _isAgeValid;
  bool? get isBloodGroupValid => _isBloodGroupValid;
  bool? get isGenderValid => _isGenderValid;
  bool? get isDobValid => _isDobValid;
  bool? get isHeightValid => _isHeightValid;
  bool? get isWeightValid => _isWeightValid;
  bool? get isEmergencyNumberValid => _isEmergencyNumberValid;
  bool get isPasswordObscured => _isPasswordObscured;
  void validateFirstName(String firstName) {
    if (firstName.isNotEmpty &&
        !firstName.contains(RegExp(r'[0-9]')) &&
        !firstName.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]')) &&
        firstName.length > 3) {
      _isFirstNameValid = true;
    } else {
      _isFirstNameValid = false;
    }
    notifyListeners();
  }

  void validateEmail(String email) {
    _isEmergencyNumberValid = EmailValidator.validate(email.trim());
    notifyListeners();
  }

  void validatePassword(String password) {
    _isPasswordValid =
        RegExp(r'^(?=.?[a-z])(?=.?[A-Z])(?=.?[0-9])(?=.?[!@#\$&*~]).{8,}$')
            .hasMatch(password.trim());
    notifyListeners();
  }

  void validatePhoneNumber(String phoneNumber) {
    RegExp phoneNumberRegex = RegExp(r'^[0-9]{10}$');
    _isPhoneNumValid = phoneNumberRegex.hasMatch(phoneNumber.trim());
    notifyListeners();
  }

  void validateDoB(String dob) {
    if (dob.isEmpty) {
      _isDobValid = false;
    } else {
      _isDobValid = true;
    }
    notifyListeners();
  }

  void validateAge(String age) {
    if (age.isEmpty) {
      _isAgeValid = false;
    } else {
      _isAgeValid = true;
    }
    notifyListeners();
  }

  void validateAddress(String address) {
    if (address.trim().length > 6 &&
        !address.contains(RegExp(r'[!@#\$%^&*().?":{}|<>]'))) {
      _isAddressValid = true;
    } else {
      _isAddressValid = false;
    }
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _isPasswordObscured = !_isPasswordObscured;
    notifyListeners();
  }
}

enum Gender { nil, male, female, other }

class GenderProvider extends ChangeNotifier {
  Gender _selectedGender = Gender.nil;

  Gender get selectedGender => _selectedGender;

  void setSelectedGender(Gender gender, TextEditingController controller) {
    _selectedGender = gender;
    controller.text = _selectedGender.toString();
    notifyListeners();
  }
}
