import 'package:adventure_nepal/forgot_password_page.dart';
import 'package:adventure_nepal/pages/login_page/sign_up_page.dart';
import 'package:adventure_nepal/widgets/bottom_nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'email_field_widget.dart';
import 'password_field_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late AnimationController _controller;
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    animation = Tween(begin: 0.1, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(5.h),
                    height: 200,
                    child: ScaleTransition(
                      scale: animation,
                      child: Image.asset(
                        'lib/image/parachute.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.h),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 92, 225, 230),
                          fontSize: 45.sp),
                    ),
                  ),
                  EmailTextFormField(emailController: _emailController),
                  const SizedBox(
                    height: 10,
                  ),
                  PasswordTextFormField(
                      passwordController: _passwordController),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => ForgotPassPage()),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 20,
                          margin: const EdgeInsets.all(10),
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: (() {
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: _emailController.text,
                              password: _passwordController.text)
                          .then(
                            (value) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => const BottomNav())),
                            ),
                          )
                          .onError(
                        (error, stackTrace) {
                          print("Error ${error.toString()}");
                        },
                      );
                    }),
                    child: Container(
                      height: 50.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 92, 225, 230),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Center(
                          child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                        ),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                  const Text(
                    "Dont have an account?",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  GestureDetector(
                    onTap: (() => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => const SignUpPage()),
                          ),
                        )),
                    child: Container(
                      margin: EdgeInsets.all(10.h),
                      padding: EdgeInsets.all(5.h),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 92, 225, 230),
                          borderRadius: BorderRadius.circular(20.r)),
                      height: 30.h,
                      width: 200.w,
                      child: const Text(
                        'Sign Up',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
