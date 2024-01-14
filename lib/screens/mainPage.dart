import 'package:fit_track/screens/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'homePage.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if(snapshot.hasData){
            print('tamil has data');
            return const HomePage();
          }
          else{
            print('tamil has not data');
            return const LoginPage();
          }
        },

      ),
    );
  }
}
