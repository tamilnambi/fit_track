import 'package:fit_track/controllers/authenticationController.dart';
import 'package:fit_track/controllers/databaseController.dart';
import 'package:fit_track/data/constants.dart';
import 'package:fit_track/screens/components/badgesList.dart';
import 'package:fit_track/screens/components/customButton.dart';
import 'package:fit_track/screens/components/titleText.dart';
import 'package:fit_track/screens/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'components/activityCards.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final authController = AuthenticationController();

  @override
  void initState() {
    super.initState();
    getUsername();
  }

  Future<void> getUsername() async {
    await authController.getUsername();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      drawer: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * 0.45,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.2,
              ),
              GestureDetector(
                onTap: () async {
                  await authController.singOut();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: const TitleText(
                  text: 'Sign Out',
                  textColor: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                decoration: BoxDecoration(
                  color: secondaryPurple,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  children: [
                    Lottie.asset(
                      'assets/dp.json',
                      repeat: false,
                      height: height * 0.15,
                      width: height * 0.15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleText(
                            text: 'Hi $username', textColor: Colors.white),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        const TitleText(
                            text: 'Have a Nice Day!', textColor: Colors.white),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const BadgesList(walking: false, running: false, cycling: false),
              SizedBox(
                height: height * 0.02,
              ),
              const Row(
                children: [
                  TitleText(text: 'Today\'s Stats', textColor: Colors.black),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              ActivityCards(),
            ],
          ),
        ),
      ),
    );
  }
}
