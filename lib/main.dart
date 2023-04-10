import 'package:adventure_nepal/pages/spalsh_screen.dart';
import 'package:adventure_nepal/provider/adventure_provider.dart';
import 'package:adventure_nepal/services/adventure_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return ChangeNotifierProvider(
          create: (context) => AdventureProvider(AdventureService()),
          child: MaterialApp(
            theme: ThemeData(
              brightness: Brightness.light,
              appBarTheme: const AppBarTheme(
                elevation: 0,
                backgroundColor: Color.fromARGB(255, 92, 225, 230),
                iconTheme: IconThemeData(color: Colors.white),
                actionsIconTheme: IconThemeData(color: Colors.grey),
                centerTitle: false,
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
          ),
        );
      },
    ),
  );
}
