import 'package:clock_in_app/shared/color.dart';
import 'package:clock_in_app/shared/keyboard_unfocus.dart';
import 'package:clock_in_app/shared/size_shared.dart';
import 'package:clock_in_app/shared/textformfield_shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _signupformKey = GlobalKey<FormState>();

  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController cNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    fNameController.dispose();
    lNameController.dispose();
    cNoController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardUnfocusFunction(
      child: Scaffold(
          backgroundColor: primaryColor,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                cardBody(),
              ]),
            ),
          )),
    );
  }

  Widget cardBody() {
    return Card(
      surfaceTintColor: Colors.white,
      elevation: 10.0,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _signupformKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Please enter all the fields",
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xff00A5B8),
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(height: Height.sizedbox_height_15),
              TextFormFieldShared(
                  controller: fNameController,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                  label: "First Name",
                  hintText: "Enter First Name",
                  readOnly: false,
                  obscureText: false),
              SizedBox(height: Height.sizedbox_height_10),
              TextFormFieldShared(
                  controller: lNameController,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                  label: "Last Name",
                  hintText: "Enter Last Name",
                  readOnly: false,
                  obscureText: false),
              SizedBox(height: Height.sizedbox_height_10),
              TextFormFieldShared(
                  controller: lNameController,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  label: "Email",
                  hintText: "Enter email",
                  readOnly: false,
                  obscureText: false),
              SizedBox(height: Height.sizedbox_height_10),
              TextFormFieldShared(
                  controller: lNameController,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                  label: "Password",
                  hintText: "Enter password",
                  readOnly: false,
                  obscureText: false),
              SizedBox(height: Height.sizedbox_height_10),
              TextFormFieldShared(
                  controller: lNameController,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please confirm your password';
                    }
                    return null;
                  },
                  label: "Confirm Password",
                  hintText: "Enter confirm password",
                  readOnly: false,
                  obscureText: false),
              SizedBox(height: Height.sizedbox_height_10),
              submitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget submitButton() {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.0),
      ),
      height: 40.0,
      color: const Color(0xff00A5B8),
      minWidth: double.infinity,
      child: const Text(
        "Submit",
        style: TextStyle(color: Colors.white, fontSize: 14.0),
      ),
      onPressed: () async {
        if (_signupformKey.currentState!.validate()) {}
      },
    );
  }

  Widget successDialog(String response) {
    return AlertDialog(
      title: const Align(
        alignment: Alignment.center,
        child: Text(
          'THANK YOU',
          style: TextStyle(
              color: Color(0xff00A5B8),
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            response,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
          ),
          SizedBox(height: Height.sizedbox_height_10),
          Padding(
            padding: const EdgeInsets.all(15),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              height: 40.0,
              color: const Color(0xff00A5B8),
              minWidth: double.infinity,
              child: const Text(
                "Ok",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                Get.back();
              },
            ),
          ),
        ],
      ),
    );
  }
}
