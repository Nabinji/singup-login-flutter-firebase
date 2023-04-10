import 'package:flutter/material.dart';
import 'package:signup_login/auth_method.dart';
import 'package:signup_login/snack_bar.dart';
import 'package:signup_login/text_field_input.dart';

import 'home_screen.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    addressController.dispose();
  }

  void signupUser() async {
    // set is loading to true.
    setState(() {
      isLoading = true;
    });
    // signup user using our authmethod
    String res = await AuthMethod().signupUser(
        email: emailController.text,
        password: passwordController.text,
        address: addressController.text,
        name: nameController.text);
    // if string return is success, user has been creaded and navigate to next screen other witse show error.
    if (res == "success") {
      setState(() {
        isLoading = false;
      });
      //navigate to the next screen
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
            SizedBox(height: height / 4.3),
            TextFieldInput(
                textEditingController: nameController,
                hintText: 'Enter your name',
                textInputType: TextInputType.text),
            const SizedBox(
              height: 24,
            ),
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
            TextFieldInput(
                textEditingController: addressController,
                hintText: 'Enter your address',
                textInputType: TextInputType.text),
            const SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: signupUser,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      color: Colors.blue),
                  child: const Text("Sign up"),
                ),
              ),
            ),
            SizedBox(
              height: height / 4.3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Login",
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
