import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_track/data/constants.dart';
import 'package:fit_track/screens/components/badgesList.dart';
import 'package:fit_track/screens/components/dailyGoalCard.dart';
import 'package:fit_track/screens/components/titleText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/activityProvider.dart';
import 'createGoal.dart';

class WalkPage extends StatefulWidget {
  const WalkPage({super.key});

  @override
  State<WalkPage> createState() => _WalkPageState();
}

class _WalkPageState extends State<WalkPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Container(
        height: 100.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              BadgesList(walking: true, running: false, cycling: false),
              SizedBox(
                height: height * 0.02,
              ),
              DailyGoalCard(
                target: 10000,
                unit: 'steps',
                acheived: Provider.of<ActivityProvider>(context, listen: true)
                    .stepCount
                    .toString(),
                percentage: Provider.of<ActivityProvider>(context, listen: true)
                        .stepCount /
                    10000,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              /*Container(
                child: FutureBuilder(
                    // Use a FutureBuilder to asynchronously retrieve data from Firestore
                    future: fetchRunGoals(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator(); // Loading indicator while data is being fetched
                      }

                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }

                      // Display the retrieved goals in a container
                      List<QueryDocumentSnapshot> goals =
                          snapshot.data as List<QueryDocumentSnapshot>;

                      return ListView.builder(
                        itemCount: goals.length,
                        itemBuilder: (context, index) {
                          // Access goal details using goals[index].data() and display in a Container
                          Map<String, dynamic> goalData =
                              goals[index].data() as Map<String, dynamic>;

                          return Container(
                            margin: EdgeInsets.all(8),
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    'Activity Type: ${goalData['activity_type']}'),
                                Text(
                                    'Starting Date: ${goalData['starting_date']}'),
                                Text('Target: ${goalData['target']}'),
                                Text('Duration: ${goalData['duration']}'),
                              ],
                            ),
                          );
                        },
                      );
                    }),
              ),*/
              SizedBox(
                height: height * 0.02,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateGoal(
                                activity: 'walk',
                              )));
                },
                child: Container(
                  height: height * 0.2,
                  width: width,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(242, 198, 222, 1.0),
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TitleText(
                          text: 'Set a New Goal', textColor: Colors.white),
                      Icon(
                        Icons.add_box,
                        color: Colors.white,
                        size: 40.0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<QueryDocumentSnapshot>> fetchRunGoals() async {
    try {
      // Reference to the goals collection
      CollectionReference goals = FirebaseFirestore.instance.collection('user_details').doc(userEmail).collection('goals');

      // Query goals where activity_type is 'run'
      QuerySnapshot querySnapshot = await goals.where('activity_type', isEqualTo: 'run').get();

      // Return the list of documents
      return querySnapshot.docs;
    } catch (e) {
      // Handle errors
      print('Error fetching goals: $e');
      return [];
    }
  }
}
