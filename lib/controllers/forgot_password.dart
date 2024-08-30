import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
    final List<TextEditingController> otpController = List.generate(
        4, (index) => TextEditingController());
    final List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());
    final RxString enteredCode = ''.obs;

    @override
    void onClose() {
        for (var controller in otpController) {
            controller.dispose();
        }
        for (var focusNode in focusNodes) {
            focusNode.dispose();
        }
        super.onClose();
    }

    void onCodeChanged(int index, String value) {
        if (value.length == 1) {
            enteredCode.value =
                otpController.map((otpValue) => otpValue.text).join();
            if (index < 3) {
                FocusScope.of(Get.context!).requestFocus(focusNodes[index + 1]);
            } else {
                FocusScope.of(Get.context!).unfocus();
            }
            if (enteredCode.value.length == 4) {
                verifyCode(enteredCode.value);
            }
        }
    }

    void verifyCode(String code) {
        if (code == '1234') {
            for (var controller in otpController) {
                controller.clear();
            }
            enteredCode.value = '';
            Get.toNamed('/reset_password');
        }
        else {
            for (var controller in otpController) {
                controller.clear();
                Get.snackbar("Error", "Invalid verification code");
            }
        }
    }
    void resendCode() {
            print("Resend code");
        }
}
