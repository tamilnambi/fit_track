import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/activityProvider.dart';
import 'components/badgesList.dart';
import 'components/dailyGoalCard.dart';
import 'components/titleText.dart';
import 'createGoal.dart';

class RunPage extends StatefulWidget {
  const RunPage({super.key});

  @override
  State<RunPage> createState() => _RunPageState();
}

class _RunPageState extends State<RunPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body:  Column(
        children: [
          SizedBox(
            height: height*0.05,
          ),
          const BadgesList(walking: false, running: true, cycling: false),
          DailyGoalCard(target: 5,
            unit: 'km',
            acheived: Provider.of<ActivityProvider>(context, listen: true)
                .runningDistance
                .toString(),
            percentage: Provider.of<ActivityProvider>(context, listen: true)
                .runningDistance/5 ,
          ),
          SizedBox(
            height: height*0.02,
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>const CreateGoal(activity: 'run',)));
            },
            child: Container(
              height: height*0.2,
              width: width,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(242, 198, 222,1.0),
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TitleText(text: 'Set a New Goal', textColor: Colors.white),
                  Icon(Icons.add_box,
                    color: Colors.white,
                    size: 40.0,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
