import 'package:adventure_nepal/pages/home_page/home_page.dart';
import 'package:adventure_nepal/pages/login_page/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //If User is Logged in
          if (snapshot.hasData) {
            return const HomePage();
          }
          //If User is Not Logged In
          else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
