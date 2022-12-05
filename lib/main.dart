import 'package:flutter/material.dart';
import 'package:shoe_app/screens/auth/login_page.dart';
import 'package:shoe_app/screens/auth/recovery_password.dart';
import 'package:shoe_app/screens/auth/sign_up_page.dart';
import 'package:shoe_app/constants.dart';
import 'package:shoe_app/screens/carousel/carousel.dart';
import 'package:shoe_app/screens/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Constants.scaffoldBackgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: Constants.scaffoldBackgroundColor,
        ),
      ),
      home: const SplashScreen(),
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
        SignUpPage.routeName: (context) => SignUpPage(),
        RecoveryPassword.routeName: (context) => RecoveryPassword(),
        SplashScreen.routeName: (context) => const SplashScreen(),
        Carousel.routeName: (context) => const Carousel(),
      },
    );
  }
}
