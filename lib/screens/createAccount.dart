import 'package:fit_track/controllers/authenticationController.dart';
import 'package:fit_track/screens/components/customTextField.dart';
import 'package:fit_track/screens/homePage.dart';
import 'package:fit_track/screens/loginPage.dart';
import 'package:flutter/material.dart';

import '../data/constants.dart';
import 'components/customButton.dart';
import 'components/customLink.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final authController = AuthenticationController();

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
                height: height * 0.1,
              ),
              SizedBox(
                  height: height * 0.3,
                  width: height * 0.3,
                  child: Image.asset('assets/logo.png')),
              SizedBox(
                height: height * 0.03,
              ),
              CustomTextField(
                controller: _usernameController,
                hintText: 'Username',
              ),
              SizedBox(
                height: height * 0.02,
              ),
              CustomTextField(
                controller: _emailController,
                hintText: 'Email',
              ),
              SizedBox(
                height: height * 0.02,
              ),
              CustomTextField(
                controller: _passwordController,
                hintText: 'Password',
              ),
              SizedBox(
                height: height * 0.02,
              ),
              CustomButton(
                onPress: () async{
                  final isCreated = await authController.createAccount(_usernameController.text,
                      _emailController.text,
                      _passwordController.text);
                  if(isCreated){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                  }
                },
                textColor: Colors.white,
                backgroundColor: secondaryPurple,
                text: 'Create Account',
              ),
              SizedBox(
                height: height * 0.03,
              ),
              CustomLink(
                onPress: () {
                  Navigator.pop(context);
                },
                text: 'Back to Login Page',
                textColor: secondaryPurple,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
