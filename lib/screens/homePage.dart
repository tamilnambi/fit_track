import 'package:fit_track/controllers/authenticationController.dart';
import 'package:fit_track/data/constants.dart';
import 'package:fit_track/screens/components/customButton.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final authController = AuthenticationController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Center(
        child: Column(
          children: [
            CustomButton(
              text: 'Sign Out',
                textColor: Colors.white,
                backgroundColor: secondaryPurple,
                onPress: () async{
                 await authController.singOut();
                }),
            Text(authController.auth.currentUser != null ?
            'logged in':'no login'),
          ],
        ),
      ),
      appBar: AppBar(
        
      ),
    );
  }
}
