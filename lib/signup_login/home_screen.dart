import 'package:flutter/material.dart';

import 'auth_method.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
              onPressed: () async {
                await AuthMethod().signOut();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const LoginScreen()));
              },
              child: const Text("LogOut"))
        ],
        title: const Text("Flutter firebase sigbup login"),
      ),
      body: const Center(
        child: Text(
          "welcome",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
