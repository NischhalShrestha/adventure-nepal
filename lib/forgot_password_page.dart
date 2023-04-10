import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassPage extends StatelessWidget {
  final _forgetEmailController = TextEditingController();

  ForgotPassPage({super.key});

  Future resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _forgetEmailController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: const Text(
                'Forgot Your Password?',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: const Text(
                'Enter your email address to receive a password reset link',
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            TextFormField(
              controller: _forgetEmailController,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                labelText: "Email Address",
                labelStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.email),
                iconColor: Colors.white,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              ),
              style: const TextStyle(color: Colors.black),
            ),
            GestureDetector(
              onTap: () {
                resetPassword();
                print('tapped ');
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 92, 225, 230),
                ),
                height: 50,
                width: 100,
                child: const Text(
                  'Send',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
