import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:signup_login/google%20login/first_screen.dart';
import 'package:signup_login/google%20login/google_auth_method.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        actions: [
          ElevatedButton(
              onPressed: () async {
                await FirebaseServices().googleSignOut();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FirstScreen()));
              },
              child: const Text("LogOut"))
        ],
        title: const Text(" Google SignIn"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network("${FirebaseAuth.instance.currentUser!.photoURL}"),
            Text("${FirebaseAuth.instance.currentUser!.email}"),
            Text("${FirebaseAuth.instance.currentUser!.displayName}"),
          ],
        ),
      ),
    );
  }
}
