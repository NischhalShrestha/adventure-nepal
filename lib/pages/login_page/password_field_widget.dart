import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordTextFormField extends StatefulWidget {
  final TextEditingController passwordController;
  const PasswordTextFormField({
    Key? key,
    required this.passwordController,
  }) : super(key: key);

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool _isHidden = true;

  passwordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passwordController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field is Empty';
        }

        if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }

        return null;
      },
      obscureText: _isHidden,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10.h),
        prefixIcon: const Icon(
          Icons.password,
          color: Colors.black,
        ),
        suffixIcon: GestureDetector(
          onTap: passwordView,
          child: Icon(
            _isHidden ? Icons.visibility : Icons.visibility_off,
            color: Colors.black,
          ),
        ),
        labelText: 'Password',
        labelStyle: const TextStyle(color: Colors.black),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
      ),
      style: const TextStyle(color: Colors.black),
    );
  }
}
