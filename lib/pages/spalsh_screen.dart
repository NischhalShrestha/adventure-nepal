import 'dart:async';

import 'package:adventure_nepal/pages/login_page/login_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _animationController.forward();
    super.initState();
    Timer(
      const Duration(seconds: 3),
      (() => Navigator.pushReplacement(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const LoginPage(),
            ),
          )),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 92, 225, 230),
      body: Center(
        child: FadeTransition(
          opacity: _animationController,
          child: Container(
            height: 400,
            child: Center(
              child: Image.asset('lib/image/adventure.png'),
            ),
          ),
        ),
      ),
    );
  }
}
