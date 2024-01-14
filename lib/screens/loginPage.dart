import 'package:fit_track/data/constants.dart';
import 'package:fit_track/screens/components/customButton.dart';
import 'package:fit_track/screens/components/customLink.dart';
import 'package:fit_track/screens/components/customTextField.dart';
import 'package:fit_track/screens/createAccount.dart';
import 'package:fit_track/screens/forgotPassword.dart';
import 'package:flutter/material.dart';

import '../controllers/authenticationController.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final authController = AuthenticationController();

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
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
            CustomTextField(
              hintText: 'Email',
              controller: _emailController,
            ),
            SizedBox(
              height: height * 0.03,
            ),
            CustomTextField(
              hintText: 'Password',
              controller: _passwordController,
              isObscure: true,
            ),
            SizedBox(
              height: height * 0.03,
            ),
            SizedBox(
              height: height * 0.03,
            ),
            CustomLink(
              onPress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ForgotPassword()));
              },
              text: 'Forgot Password?',
              textColor: secondaryPurple,
            ),
            SizedBox(
              height: height * 0.03,
            ),
            CustomButton(
              onPress: () {
                authController.logInWithDetails(_emailController.text.trim(),
                    _passwordController.text.trim());
              },
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
                    MaterialPageRoute(builder: (context) => const CreateAccount()));
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
