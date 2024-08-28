import 'package:flutter/material.dart';
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

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
