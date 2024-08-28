import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupFormController extends GetxController {
  // Form Key
  final formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final universityController = TextEditingController();
  final courseController = TextEditingController();
  final yearOfStudyController = TextEditingController();
  final passwordController = TextEditingController();

  // Reactive variable for password visibility
  var obscurePassword = true.obs;

  // Toggle password visibility
  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  @override
  void onClose() {
    // Dispose of controllers when the controller is removed
    nameController.dispose();
    emailController.dispose();
    universityController.dispose();
    courseController.dispose();
    yearOfStudyController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
