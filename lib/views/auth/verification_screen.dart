import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/email_verification_controllers.dart'; // Correct the path as needed

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final EmailVerificationController controller = Get.put(EmailVerificationController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Email Verification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Verification Email',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Please enter the 4-digit code we just sent to your email',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4, // Number of code boxes
                    (index) => _buildCodeBox(controller, index),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: controller.resendCode,
              child: const Text(
                'Didn\'t receive the code? Resend',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            const SizedBox(height: 20),
            Obx(() => ElevatedButton(
              onPressed: controller.enteredCode.value.length == 4 ? () => controller.verifyCode(controller.enteredCode.value) : null,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Continue'),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildCodeBox(EmailVerificationController controller, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0), // Space between boxes
      child: SizedBox(
        width: 50,
        child: TextField(
          controller: controller.codeControllers[index],
          focusNode: controller.focusNodes[index],
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          maxLength: 1,
          decoration: const InputDecoration(
            counterText: '', // Hide the default counter text
            border: OutlineInputBorder(),
          ),
          onChanged: (value) => controller.onCodeChanged(index, value),
        ),
      ),
    );
  }
}
