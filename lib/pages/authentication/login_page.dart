import 'package:clock_in_app/shared/color.dart';
import 'package:clock_in_app/shared/keyboard_unfocus.dart';
import 'package:clock_in_app/shared/textformfield_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _passwordVisible = false;

  late String finalEmail;
  late String finalPassword;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: KeyboardUnfocusFunction(
        child: Scaffold(
          body: Form(
            key: _formKey,
            child: Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF000000).withAlpha(60),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                        offset: const Offset(
                          0.0,
                          3.0,
                        ),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/images/clock.png',
                    width: 40.w,
                    height: 20.h,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormFieldShared(
                          controller: emailTextController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please fill in your email';
                            }
                            return null;
                          },
                          label: "Email",
                          hintText: "",
                          prefixIcon: Icons.email_rounded,
                          readOnly: false,
                          obscureText: false),
                      SizedBox(
                        height: 1.0.h,
                      ),
                      TextFormFieldShared(
                          controller: passwordTextController,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please fill in your password';
                            }
                            return null;
                          },
                          label: "Password",
                          hintText: "",
                          prefixIcon: Icons.key,
                          suffixIcon: IconButton(
                              onPressed: () {
                                if (passwordTextController.text.isNotEmpty) {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                }
                                print(_passwordVisible);
                              },
                              icon: _passwordVisible
                                  ? PhosphorIcon(PhosphorIcons.eye())
                                  : PhosphorIcon(PhosphorIcons.eyeClosed())),
                          readOnly: false,
                          obscureText: _passwordVisible ? false : true,
                          onChanged: (value) {},
                          lines: 1),
                      SizedBox(
                        height: 1.0.h,
                      ),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                      ),
                      SizedBox(
                        height: 1.0.h,
                      ),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        height: 50.0,
                        color: primaryColor,
                        minWidth: double.infinity,
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        onPressed: () async {
                          // if (_formKey.currentState!.validate()) {
                          setState(() {
                            finalEmail = emailTextController.text;
                            finalPassword = passwordTextController.text;
                          });
                          // await lc
                          //     .checkSignIn(emailTextController.text,
                          //         passwordTextController.text)
                          //     .then((value) {
                          //   Get.offAndToNamed('/mainPage');
                          //   Preference.setBool(Preference.isLogin, true);
                          // });
                          // }
                        },
                      ),
                      SizedBox(
                        height: 3.0.h,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed('/signupPage');
                        },
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}