import 'package:adventure_nepal/pages/login_page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:adventure_nepal/pages/login_page/email_field_widget.dart';
import 'package:adventure_nepal/pages/login_page/password_field_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmailTextFormField(emailController: _emailController),
              PasswordTextFormField(passwordController: _passwordController),
              TextButton(
                onPressed: (() {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text)
                      .then(
                        (value) => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const LoginPage())),
                        ),
                      )
                      .onError((error, stackTrace) {
                    print("error${error.toString()}");
                  });
                }),
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
