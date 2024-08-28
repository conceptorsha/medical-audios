import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AccountController extends GetxController {
  // Text Editing Controllers for the form fields
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  // Method to save changes
  void saveChanges() {
    if (nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      // Add logic to save the updated profile data
      Get.snackbar('Success', 'Profile updated successfully',
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar('Error', 'Please fill all fields',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }

  // Dispose controllers when done to free up resources
  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
