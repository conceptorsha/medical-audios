import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/register_controllers.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupFormController controller = Get.put(SignupFormController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Form(
              key: controller.formKey,
              child: Column(
                children: [
                  // Name TextFormField
                  _buildTextField(
                    controller: controller.nameController,
                    label: 'Name',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Email TextFormField
                  _buildTextField(
                    controller: controller.emailController,
                    label: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // University TextFormField
                  _buildTextField(
                    controller: controller.universityController,
                    label: 'University',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your university';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Course TextFormField
                  _buildTextField(
                    controller: controller.courseController,
                    label: 'Course',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your course';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Year of Study TextFormField
                  _buildTextField(
                    controller: controller.yearOfStudyController,
                    label: 'Year of Study',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your year of study';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Password TextFormField
                  Obx(() => _buildTextField(
                    controller: controller.passwordController,
                    label: 'Password',
                    obscureText: controller.obscurePassword.value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.obscurePassword.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: controller.togglePasswordVisibility,
                    ),
                  )),
                  const SizedBox(height: 30),

                  // Register Button
                  ElevatedButton(
                    onPressed: () {
                      if (controller.formKey.currentState?.validate() ?? false) {
                        // Process registration
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('Register'),
                  ),
                  const SizedBox(height: 20),

                  // Have an account? Login
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Have an account? ',
                        style: TextStyle(fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('/login'); // Navigate to Login screen
                        },
                        child: Text(
                          'Login',
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

                  // Terms and Conditions Text
                  Text(
                    'By clicking Register you agree to our terms and conditions.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    required FormFieldValidator<String>? validator,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        suffixIcon: suffixIcon,
      ),
      validator: validator,
    );
  }
}
