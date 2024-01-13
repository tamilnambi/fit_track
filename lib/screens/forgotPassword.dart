import 'package:fit_track/screens/components/customLink.dart';
import 'package:fit_track/screens/components/customTextField.dart';
import 'package:flutter/material.dart';

import '../data/constants.dart';
import 'components/customButton.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController _emailField = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: height*0.1,
              ),
              SizedBox(
                  height: height*0.3,
                  width: height*0.3,
                  child: Image.asset('assets/logo.png')),
              SizedBox(
                height: height*0.03,
              ),
              CustomTextField(
                controller: _emailField,
                hintText: 'Enter Registered Email',
              ),
              SizedBox(
                height: height*0.02,
              ),
              CustomButton(
                onPress: (){},
                textColor: Colors.white,
                backgroundColor: secondaryPurple,
                text: 'Reset Password',
              ),
              SizedBox(
                height: height*0.03,
              ),
              CustomLink(onPress: (){
                Navigator.pop(context);
              },
              text: 'Back to Login Page',
              textColor: secondaryPurple,)
            ],
          ),
        ),
      ),
    );
  }
}
