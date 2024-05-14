import 'package:flutter/material.dart';


class MyTextField extends StatefulWidget {
  final controller;
  final String hintText;
  final String? errorText;
  final TextStyle errorStyle;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.errorText,
    required this.errorStyle,
    this.obscureText = false,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.obscureText ? _isObscure : false,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
          errorText: widget.errorText,
          errorStyle: widget.errorStyle,
          suffixIcon: widget.obscureText
              ? IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}
