import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsOption extends StatelessWidget {
  final String title;
  const SettingsOption({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(20.r)),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width,
      child: Text(
        title,
        style: TextStyle(color: Colors.black),
        textAlign: TextAlign.center,
      ),
    );
  }
}
