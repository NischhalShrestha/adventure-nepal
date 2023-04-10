import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailTextFormField extends StatelessWidget {
  const EmailTextFormField({
    Key? key,
    required TextEditingController emailController,
  })  : _emailController = emailController,
        super(key: key);

  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      controller: _emailController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return ('Field is empty');
        }
        String pattern =
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

        if (!RegExp(pattern).hasMatch(value)) {
          return 'Email is not valid';
        }

        return null;
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10.h),
        prefixStyle: const TextStyle(color: Colors.black),
        labelText: 'Email',
        labelStyle: const TextStyle(color: Colors.black),
        prefixIcon: const Icon(
          Icons.email,
          color: Colors.black,
        ),
        // fillColor: Colors.white,
        iconColor: Colors.black,
        // hintText: 'Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      style: const TextStyle(color: Colors.black),
    );
  }
}
