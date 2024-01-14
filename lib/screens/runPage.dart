import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/activityProvider.dart';
import 'components/badgesList.dart';
import 'components/dailyGoalCard.dart';

class RunPage extends StatefulWidget {
  const RunPage({super.key});

  @override
  State<RunPage> createState() => _RunPageState();
}

class _RunPageState extends State<RunPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body:  Column(
        children: [
          SizedBox(
            height: height*0.05,
          ),
          BadgesList(walking: false, running: true, cycling: false),
          DailyGoalCard(target: 5,
            unit: 'km',
            acheived: Provider.of<ActivityProvider>(context, listen: true)
                .runningDistance
                .toString(),
            percentage: Provider.of<ActivityProvider>(context, listen: true)
                .runningDistance/5 ,
          ),
        ],
      ),
    );
  }
}
