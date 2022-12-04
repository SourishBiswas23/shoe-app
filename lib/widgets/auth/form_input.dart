import 'package:flutter/material.dart';

import '../../constants.dart';

class FormInput extends StatefulWidget {
  FormInput({
    Key? key,
    required this.labelText,
    this.isPassword = false,
    required TextEditingController controller,
  })  : _controller = controller,
        super(key: key);

  final String labelText;
  final bool isPassword;
  final TextEditingController _controller;
  bool _obscureText = true;

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        TextFormField(
          obscureText: widget._obscureText,
          controller: widget._controller,
          decoration: InputDecoration(
            fillColor: Constants.textFormFieldcolor,
            filled: true,
            suffixIcon: widget.isPassword
                ? Theme(
                    data: ThemeData(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    ),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          widget._obscureText = !widget._obscureText;
                        });
                      },
                      icon: widget._obscureText
                          ? const Icon(
                              Icons.visibility_outlined,
                              color: Colors.grey,
                            )
                          : const Icon(
                              Icons.visibility_off_outlined,
                              color: Colors.grey,
                            ),
                    ),
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
          cursorColor: Constants.cursorColor,
        ),
      ],
    );
  }
}
