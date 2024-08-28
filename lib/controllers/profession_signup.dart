import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupFormsController extends GetxController {
  // Form Key
  final formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final companyNameController = TextEditingController();
  final professionController = TextEditingController();
  final yearsOfExpertiseController = TextEditingController();
  final passwordController = TextEditingController();

  // Reactive variable for password visibility
  var obscurePassword = true.obs;

  // Toggle password visibility
  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }
}
