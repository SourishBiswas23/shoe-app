import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../widgets/auth/form_input.dart';

class RecoveryPassword extends StatelessWidget {
  RecoveryPassword({super.key});

  static const routeName = '/recovery-password';
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailAddress = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          color: Colors.black,
          onPressed: () => Navigator.of(context).pop(),
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
                  'Recovery Password',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Please Enter Your Email Address To',
                  style: TextStyle(color: Colors.grey),
                ),
                const Text(
                  'Receive a Verification Code',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 40),
                FormInput(
                  labelText: 'Email Address',
                  controller: _emailAddress,
                ),
                const SizedBox(height: 40),
                const ContinueButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Constants.buttonColor,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        onPressed: () {},
        child: const Text(
          'Continue',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
