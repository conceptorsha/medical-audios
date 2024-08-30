import 'package:flutter/material.dart';
import 'package:medical_audios/controllers/login_controllers.dart';
import 'package:medical_audios/controllers/forgot_password.dart';
import 'package:get/get.dart';
import 'package:email_validator/email_validator.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final LoginController controller = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();
  final ForgotPasswordController otpController =
      Get.put(ForgotPasswordController());

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
              const SizedBox(
                height: 20,
              ),
              Text(
                "Please provide the email you used when you signed up for your account",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  controller: controller.emailController,
                  validator: (value) => EmailValidator.validate(controller.emailController.text)
                      ? null
                      : "Enter a valid email address",
                  decoration: const InputDecoration(
                    labelText: "Email Address",
                    border: OutlineInputBorder(),
                    // errorText:
                    //   controller.verifyEmail(controller.emailController.value.text)
                    //       ? null
                    //       : "Enter a valid email address"
                ),
                keyboardType: TextInputType.emailAddress,
                ),),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(
                        "Verification code",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      content: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Please enter the verification code sent to your email",
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              4,
                              (index) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: SizedBox(
                                  width: 50,
                                  child: TextFormField(
                                    controller:
                                        otpController.otpController[index],
                                    focusNode: otpController.focusNodes[index],
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    maxLength: 1,
                                    decoration: const InputDecoration(
                                      counterText:
                                          '', // Hide the default counter text
                                      border: OutlineInputBorder(),
                                    ),
                                    onChanged: (value) => otpController
                                        .onCodeChanged(index, value),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextButton(
                            onPressed: otpController.resendCode,
                            child:
                                const Text("Didn't receive the code? Resend"),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          // ElevatedButton(
                          //   onPressed: (){
                          //     otpController.verifyCode(otpController.enteredCode.value);
                          //   },
                          //   child: Text("Continue",
                          //     style: Theme.of(context).textTheme.titleLarge),
                          // ),
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
          ),
        ),
      ),
    );
  }
}
