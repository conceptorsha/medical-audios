import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_audios/views/auth/forgot_password.dart';
import '../../controllers/login_controllers.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            // Greeting Text
            Row(
              children: [
                const Text(
                  "Hey, ",
                  style: TextStyle(fontSize: 32),
                ),
                const Text(
                  "Danny",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                Icon(
                  Icons.waving_hand,
                  color: Theme.of(context).primaryColor,
                  size: 32,
                ),
              ],
            ),
            const SizedBox(height: 40),

            // Profession/Student Dropdown
            Obx(() => DropdownButtonFormField<String>(
              value: controller.selectedOption.value,
              decoration: const InputDecoration(
                labelText: 'Select Role',
                border: OutlineInputBorder(),
              ),
              onChanged: controller.onOptionSelected,
              items: controller.options.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
            )),
            const SizedBox(height: 20),

            // Email TextFormField
            TextFormField(
              controller: controller.emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),

            // Password TextFormField
            TextFormField(
              controller: controller.passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),

            // Forgot Password Text
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Get.toNamed("/forgot_password");
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Login Button
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/dashboard'); // Uncomment and update the route

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF5722),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('Login'),
            ),
            const SizedBox(height: 20),

            // Don't have an account? Text and Sign Up
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account? ",
                  style: TextStyle(fontSize: 16),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/professional_signup'); // Navigate to Sign Up screen
                  },
                  child: Text(
                    'Create one',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Sign up with Google and Apple
            Column(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Get.toNamed('/email');
                 },
                  icon: const Icon(Icons.g_mobiledata),
                  label: const Text('Sign Up with Google'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    Get.toNamed('/email'); // Navigate to Login screen
                  },
                  icon: const Icon(Icons.apple),
                  label: const Text('Sign Up with Apple'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
