import 'package:fit_track/data/constants.dart';
import 'package:fit_track/screens/components/titleText.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class DailyGoalCard extends StatelessWidget {
  final int target;
  final String unit;
  final acheived;
  final double percentage;
  const DailyGoalCard({super.key, required this.target, required this.unit, this.acheived, required this.percentage});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height*0.2,
      decoration: BoxDecoration(
        color: lightBlue,
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
      child: Row(
        children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircularPercentIndicator(
          radius: 50.0,
          backgroundColor: Colors.blue.shade200,
          progressColor: Colors.white,
          animation: true,
          animationDuration: 1000,
          lineWidth: 6.0,
          percent: percentage,
          reverse: false,
          startAngle: 0.0,
          animateFromLastPercent: true,
          circularStrokeCap: CircularStrokeCap.round,
          ),
        ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleText(text: 'Daily Goal', textColor: Colors.white),
              SizedBox(
                height: height*0.02,
              ),
              Text('$acheived/$target $unit',
              style: TextStyle(fontSize: 25.0, color: Colors.white),)
            ],
          ),
        ],
      ),
    );
  }
}
