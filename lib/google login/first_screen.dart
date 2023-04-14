import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:signup_login/google%20login/google_auth_method.dart';
import 'package:signup_login/google%20login/welcome_page.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 35, 91, 143),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.48,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  style: ButtonStyle(backgroundColor:
                      MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.black;
                    }
                    return Colors.white;
                  })),
                  onPressed: () async {
                    await FirebaseServices().signInWithGoogle();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WelcomePage()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 25)),
                      Image.network(
                        "https://assets.stickpng.com/images/5847f9cbcef1014c0b5e48c8.png",
                        height: 35,
                        width: 35,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Continue with Google",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
