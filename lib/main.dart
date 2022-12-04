import 'package:flutter/material.dart';
import 'package:shoe_app/pages/auth/login_page.dart';
import 'package:shoe_app/pages/auth/recovery_password.dart';
import 'package:shoe_app/pages/auth/sign_up_page.dart';
import 'package:shoe_app/constants.dart';

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
      home: LoginPage(),
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
        SignUpPage.routeName: (context) => SignUpPage(),
        RecoveryPassword.routeName: (context) => RecoveryPassword(),
      },
    );
  }
}
