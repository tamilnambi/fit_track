import 'package:fit_track/providers/activityProvider.dart';
import 'package:fit_track/screens/components/homePageCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActivityCards extends StatefulWidget {
  const ActivityCards({super.key});

  @override
  State<ActivityCards> createState() => _ActivityCardsState();
}

class _ActivityCardsState extends State<ActivityCards> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
        create: (context) => ActivityProvider(),
        builder:(context,child){
        return Column(
          children: [
            HomePageCard(
                titleText: 'You have walked',
                subValue1: Provider.of<ActivityProvider>(context, listen: true)
                    .stepCount
                    .toString(),
                subValue2: Provider.of<ActivityProvider>(context, listen: true)
                    .walkingDistance
                    .toString(),
              subText1: 'steps',
              subText2: 'km',
            ),
            SizedBox(
              height: height * 0.035,
            ),
            HomePageCard(
                titleText: 'You have ran',
                subValue1: Provider.of<ActivityProvider>(context, listen: false)
                    .runningCount
                    .toString(),
                subValue2: '0',
                subText1: 'steps',
                subText2: 'km',
            ),
            SizedBox(
              height: height * 0.035,
            ),
            HomePageCard(
                titleText: 'You have cycled',
                subValue1: Provider.of<ActivityProvider>(context, listen: false)
                    .cyclingCount
                    .toString(),
                subValue2: '0',
                subText1: 'km',
                subText2: 'min',
            ),
            SizedBox(
              height: height * 0.035,
            ),
          ],
        );}
    );
  }
}
