import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'profession_screen.dart';
import 'signup_screen.dart';
import 'verification_screen.dart'; // Import the SignupScreen

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // "Hey, welcome!" text with a waving hand icon
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hey, welcome!",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  "👋",
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
            SizedBox(height: 20),

            // "Tell us about yourself" text
            Text(
              "Tell us about yourself",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 40),

            // "I am a student" button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignupScreen(), // Navigate to SignupScreen
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text("I am a student"),
            ),
            SizedBox(height: 20),

            // "I am a professional" button
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/professional_signup');

              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text("I am a professional"),
            ),
            SizedBox(height: 40),

            // "Have an account? Login" text with clickable "Login"
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Have an account? ",
                  style: TextStyle(fontSize: 16),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle login navigation
                    Navigator.pushNamed(context, '/login'); // Update with your actual login route
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),

            // "Sign in with Google" button
            ElevatedButton.icon(
              onPressed: () {
                Get.toNamed('/email');
                // Handle sign in with Google
              },
              icon: Icon(Icons.g_translate), // Replace with Google icon
              label: Text("Sign in with Google"),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
              ),
            ),
            SizedBox(height: 20),

            // "Sign in with Apple" button
            ElevatedButton.icon(
              onPressed: () {
                Get.toNamed('/email');

                },
              icon: Icon(Icons.apple), // Replace with Apple icon
              label: Text("Sign in with Apple"),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
