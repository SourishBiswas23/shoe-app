import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shoe_app/pages/auth/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const routeName = '/splash-screen';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Lottie.asset(
        'assets/lottie/shoe-lottie.json',
        controller: _animationController,
        height: MediaQuery.of(context).size.height,
        onLoaded: (composition) {
          _animationController.forward().whenComplete(
                () => Navigator.of(context)
                    .pushReplacementNamed(LoginPage.routeName),
              );
        },
      ),
    );
  }
}
