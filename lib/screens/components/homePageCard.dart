import 'package:flutter/material.dart';

import '../../data/constants.dart';

class HomePageCard extends StatelessWidget {
  final String titleText;
  final String time;
  final String distance;
  const HomePageCard({super.key, required this.titleText, required this.time, required this.distance});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height*0.25,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: height*0.02),
            child: Text(titleText,
              style: TextStyle(
                fontSize: height*0.03,
              ),),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: height*0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(time,style: TextStyle(
                      color: lightBlue,
                      fontSize: height*0.075,
                      fontWeight: FontWeight.bold,
                    ),),
                    Text('km', style: TextStyle(color: darkBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: height*0.02),)
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(distance,style: TextStyle(
                      color: lightBlue,
                      fontSize: height*0.075,
                      fontWeight: FontWeight.bold,
                    ),),
                    Text('min', style: TextStyle(color: darkBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: height*0.02),)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
