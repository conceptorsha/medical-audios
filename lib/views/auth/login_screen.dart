import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_audios/views/auth/verification_screen.dart';
import '../../controllers/login_controllers.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            // Greeting Text
            Row(
              children: [
                Text(
                  "Hey, ",
                  style: TextStyle(fontSize: 32),
                ),
                Text(
                  "Danny",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.waving_hand,
                  color: Theme.of(context).primaryColor,
                  size: 32,
                ),
              ],
            ),
            SizedBox(height: 40),

            // Profession/Student Dropdown
            Obx(() => DropdownButtonFormField<String>(
              value: controller.selectedOption.value,
              decoration: InputDecoration(
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
            SizedBox(height: 20),

            // Email TextFormField
            TextFormField(
              controller: controller.emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),

            // Password TextFormField
            TextFormField(
              controller: controller.passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            // Forgot Password Text
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Handle forgot password
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Login Button
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/dashboard'); // Uncomment and update the route

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFF5722),
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text('Login'),
            ),
            SizedBox(height: 20),

            // Don't have an account? Text and Sign Up
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
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
            SizedBox(height: 20),

            // Sign up with Google and Apple
            Column(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Get.toNamed('/email');
                 },
                  icon: Icon(Icons.g_mobiledata),
                  label: Text('Sign Up with Google'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    Get.toNamed('/email'); // Navigate to Login screen
                  },
                  icon: Icon(Icons.apple),
                  label: Text('Sign Up with Apple'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: Size(double.infinity, 50),
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
