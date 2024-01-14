import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/activityProvider.dart';
import 'components/badgesList.dart';
import 'components/dailyGoalCard.dart';

class CyclePage extends StatefulWidget {
  const CyclePage({super.key});

  @override
  State<CyclePage> createState() => _CyclePageState();
}

class _CyclePageState extends State<CyclePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body:  Column(
        children: [
          SizedBox(
            height: height*0.05,
          ),
          BadgesList(walking: false, running: false, cycling: true),
          DailyGoalCard(target: 10,
            unit: 'km',
            acheived: Provider.of<ActivityProvider>(context, listen: true)
                .cyclingDistance
                .toString(),
            percentage: Provider.of<ActivityProvider>(context, listen: true)
                .cyclingDistance/10 ,
          ),
        ],
      ),
    );
  }
}
