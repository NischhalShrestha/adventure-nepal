import 'package:adventure_nepal/pages/settings_page/settings_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.arrow_back_ios_new_sharp,
                  color: Colors.grey,
                  size: 24.h,
                ),
                SizedBox(
                  width: 110.w,
                ),
                Text(
                  'About me',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            Container(
              width: 200,
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage(''),
                    backgroundColor: Colors.black,
                  ),
                  Text(
                    'Username',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  Text(
                    'email@gmail.com',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 90.h,
                    width: 140.w,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text("Edit Profile")),
                  ),
                  Container(
                    height: 90.h,
                    width: 140.w,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text("Share Profile")),
                  ),
                ],
              ),
            ),
            const SettingsOption(
              title: 'Change Password',
            ),
            const SettingsOption(
              title: 'Hello Darkness',
            ),
            const SettingsOption(
              title: 'About Us',
            ),
            SettingsOption(title: 'title')
          ],
        ),
      ),
    );
  }
}
