import 'package:flutter/material.dart';
import 'package:signup_login/home_screen.dart';
import 'package:signup_login/signup_screen.dart';
import 'package:signup_login/snack_bar.dart';

import 'package:signup_login/text_field_input.dart';

import 'auth_method.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

// email and passowrd auth part
  void loginUser() async {
    setState(() {
      isLoading = true;
    });
    // signup user using our authmethod
    String res = await AuthMethod().loginUser(
        email: emailController.text, password: passwordController.text);

    if (res == "success") {
      setState(() {
        isLoading = false;
      });
      //navigate to the home screen
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      setState(() {
        isLoading = false;
      });
      // show error
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height / 3),
            TextFieldInput(
                textEditingController: emailController,
                hintText: 'Enter your email',
                textInputType: TextInputType.text),
            const SizedBox(
              height: 24,
            ),
            TextFieldInput(
              textEditingController: passwordController,
              hintText: 'Enter your passord',
              textInputType: TextInputType.text,
              isPass: true,
            ),
            const SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: loginUser,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      color: Colors.blue),
                  child: const Text("Log in"),
                ),
              ),
            ),
            SizedBox(
              height: height / 3.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SignupScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "SignUp",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
