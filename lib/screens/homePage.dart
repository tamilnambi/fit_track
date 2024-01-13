import 'package:fit_track/data/constants.dart';
import 'package:fit_track/screens/components/customButton.dart';
import 'package:fit_track/screens/components/customLink.dart';
import 'package:fit_track/screens/components/customTextField.dart';
import 'package:fit_track/screens/components/loginTextFields.dart';
import 'package:fit_track/screens/createAccount.dart';
import 'package:fit_track/screens/forgotPassword.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.1,
            ),
            SizedBox(
                height: height * 0.3,
                width: height * 0.3,
                child: Image.asset('assets/logo.png')),
            loginTextFields(context, height),
            SizedBox(
              height: height * 0.03,
            ),
            CustomLink(
              onPress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ForgotPassword()));
              },
              text: 'Forgot Password?',
              textColor: secondaryPurple,
            ),
            SizedBox(
              height: height * 0.03,
            ),
            CustomButton(
              onPress: () {},
              textColor: Colors.white,
              backgroundColor: secondaryPurple,
              text: 'Log In',
            ),
            SizedBox(
              height: height * 0.02,
            ),
            CustomButton(
              onPress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreateAccount()));
              },
              textColor: Colors.white,
              backgroundColor: secondaryPurple,
              text: 'Create Account',
            ),
          ],
        ),
      ),
    );
  }
}
