import 'package:flutter/material.dart';
import 'package:medical_audios/controllers/login_controllers.dart';
import 'package:medical_audios/controllers/email_verification_controllers.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatelessWidget{
  ForgotPassword({super.key});

  final LoginController controller = Get.put(LoginController());
  final EmailVerificationController codeControllers = Get.put(EmailVerificationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(27.0),
        child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Reset your password",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
              ),
            const SizedBox(height: 20,),
            Text(
              "Please provide the email you used when you signed up for your account",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
              ),
            const SizedBox(height: 20,),
            TextFormField(
              controller: controller.emailController,
              decoration: const InputDecoration(
                labelText: "Email Address",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
              ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){
                showDialog(
                  context: context, 
                  builder: (context) =>
                    AlertDialog(
                      title: Text(
                        "Verification code",
                        style: Theme.of(context).textTheme.titleLarge,
                        ),
                      content: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text("Please enter the verification code sent to your email", textAlign: TextAlign.center,),
                          const SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: 
                              List.generate(
                                4, 
                                (index) => Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                  child: SizedBox(
                                    width: 50,
                                    child: TextFormField(
                                      controller: codeControllers.codeControllers[index],
                                      focusNode: codeControllers.focusNodes[index],
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      maxLength: 1,
                                      decoration: const InputDecoration(
                                        counterText: '', // Hide the default counter text
                                        border: OutlineInputBorder(),
                                      ),
                                      onChanged: (value) => codeControllers.onCodeChanged(index, value),
                                    ),
                                  ),
                                ),
                              ),
                          ),
                          const SizedBox(height: 15,),
                          TextButton(
                            onPressed: codeControllers.resendCode, 
                            child: const Text("Didn't receive the code? Resend"),),
                          const SizedBox(height: 15,),
                          ElevatedButton(
                            onPressed: (){
                              Get.toNamed('/reset_password');
                            }, 
                            child: Text("Continue",
                              style: Theme.of(context).textTheme.titleLarge),
                          ),
                        ],
                      ),
                    ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 39, 18, 203),
                foregroundColor: Colors.white,
              ),
              child: const Text("Send OTP"),
            ),
          ],
        ),),
      ),
    );   
  }
}

