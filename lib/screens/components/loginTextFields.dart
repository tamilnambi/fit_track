import 'package:fit_track/data/constants.dart';
import 'package:flutter/material.dart';

Widget loginTextFields(BuildContext context,double height) {
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();
  bool isObscure = true;
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.0),
    child: Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          textAlign: TextAlign.center,
          controller: _emailField,
          decoration: InputDecoration(
            focusColor: primaryPink,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1.0, color: primaryPink),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 2.0, color: primaryPink),
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            prefixIcon: const Icon(
              Icons.email,
              color: primaryPink,
              size: 30.0,
            ),
            hintText: "Email",
            hintStyle: const TextStyle(color: primaryPink),
          ),
        ),
        SizedBox(height: height * 0.05),
        TextFormField(
          textAlign: TextAlign.center,
          controller: _passwordField,
          obscureText: isObscure,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1.0, color: primaryPink),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2.0, color: primaryPink),
                borderRadius: BorderRadius.circular(12.0)),
            prefixIcon: IconButton(
              onPressed: () {
                isObscure = !isObscure;
              },
              icon: Icon(isObscure
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: primaryPink,
                size: 30.0,
              ),
            ),
            hintText: "Password",
            hintStyle: const TextStyle(color: primaryPink),
          ),
        ),
      ],
    ),
  );
}
