import 'package:flutter/material.dart';
// import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final RxString selectedOption = 'Profession'.obs;
  final List<String> options = ['Profession', 'Student'];

  // Update this method to accept a nullable String
  void onOptionSelected(String? value) {
    if (value != null) {
      selectedOption.value = value;
    }
  }

  // String? verifyEmail(String email){
  //   bool isValid = EmailValidator.validate(email);
  //   print("The value of isValid is $isValid and email is $email");
  //   return isValid ? null : "Enter a valid email address";
  // }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
