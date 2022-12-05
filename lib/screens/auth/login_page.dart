import 'package:flutter/material.dart';
import 'package:shoe_app/screens/auth/recovery_password.dart';
import 'package:shoe_app/screens/auth/sign_up_page.dart';
import '../../widgets/auth/form_input.dart';
import '../../widgets/auth/form_sign_in_button.dart';
import '../../widgets/auth/google_sign_in_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  static const routeName = '/login-page';
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailAddress = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.black,
        ),
        elevation: 0,
      ),
      body: Form(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const Text(
                  'Hello Again!',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Welcome Back You\'ve Been Missed!',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 40),
                FormInput(
                  labelText: 'Email Address',
                  controller: _emailAddress,
                ),
                const SizedBox(height: 30),
                FormInput(
                  labelText: 'Password',
                  controller: _password,
                  isPassword: true,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context)
                          .pushNamed(RecoveryPassword.routeName),
                      child: Text(
                        'Recovery Password',
                        style: TextStyle(
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: FormSignInButton(),
                ),
                const SizedBox(height: 40),
                const GoogleSignInButton(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            Text(
              'Don\'t have an account?',
              style: TextStyle(color: Colors.grey.shade400),
            ),
            GestureDetector(
              child: const Text('Sign Up For Free'),
              onTap: () => Navigator.of(context)
                  .pushReplacementNamed(SignUpPage.routeName),
            )
          ],
        ),
      ),
    );
  }
}
