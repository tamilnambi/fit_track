import 'package:flutter/material.dart';

import '../../data/constants.dart';

class CustomTextField extends StatelessWidget {
  final controller;
  final hintText;
  final isObscure;
  const CustomTextField({super.key, this.controller, this.hintText, this.isObscure});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: width*0.08),
      child: TextFormField(
        textAlign: TextAlign.center,
        controller: controller,
        obscureText: isObscure ?? false,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1.0, color: primaryPink),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 2.0, color: primaryPink),
              borderRadius: BorderRadius.circular(12.0)),
          hintText: hintText,
          hintStyle: const TextStyle(color: primaryPink),
        ),
      ),
    );
  }
}
