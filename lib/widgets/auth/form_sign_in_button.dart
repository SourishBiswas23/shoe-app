import 'package:flutter/material.dart';

import '../../constants.dart';

class FormSignInButton extends StatelessWidget {
  const FormSignInButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
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
        'Sign In',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
