import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerificationController extends GetxController {
  final List<TextEditingController> codeControllers = List.generate(4, (index) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());
  final RxString enteredCode = ''.obs;

  @override
  void onClose() {
    for (var controller in codeControllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.onClose();
  }

  void onCodeChanged(int index, String value) {
    if (value.length == 1) {
      enteredCode.value = codeControllers.map((controller) => controller.text).join();
      if (index < 3) {
        FocusScope.of(Get.context!).requestFocus(focusNodes[index + 1]);
      } else {
        FocusScope.of(Get.context!).unfocus(); // Remove focus from the last box
      }
      if (enteredCode.value.length == 4) {
        verifyCode(enteredCode.value);
      }
    }
  }

  void verifyCode(String code) {
    // Example verification logic
    if (code == '1234') { // Replace with actual verification logic
      // Clear the code input boxes
      for (var controller in codeControllers) {
        controller.clear();
      }
      enteredCode.value = '';
      // Navigate to the CongratulationsScreen
      Get.toNamed('/congrats'); // Ensure this route is defined in your routes
    } else {
      // Handle invalid code
      Get.snackbar('Error', 'Invalid verification code');
    }
  }

  void resendCode() {
    // Handle resend code logic
    print('Resend code');
  }
}
