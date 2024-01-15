import 'package:fit_track/controllers/databaseController.dart';
import 'package:fit_track/screens/components/titleText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateGoal extends StatefulWidget {
  final String activity;
  const CreateGoal({super.key, required this.activity});

  @override
  State<CreateGoal> createState() => _CreateGoalState();
}

class _CreateGoalState extends State<CreateGoal> {
  String selectedInterval = '';
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    TextEditingController textController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 40.0,
        ),
        child: Container(
          constraints: const BoxConstraints.expand(),
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height*0.15,
                ),
                const TitleText(text: 'New Goal',
                    textColor: Colors.white),
                SizedBox(
                  height: height*0.1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildCustomRadio('Daily', 'daily'),
                    buildCustomRadio('Weekly', 'weekly'),
                    buildCustomRadio('Monthly', 'monthly'),
                  ],
                ),
                SizedBox(
                  height: height*0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: width*0.2,
                      child: TextField(
                        controller: textController,
                      ),
                    ),
                    const Text('km',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0
                    ),),
                  ],
                ),
                SizedBox(
                  height: height*0.1,
                ),
                GestureDetector(
                  onTap: (){
                    saveGoal(textController.text);
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(242, 170, 222,1.0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Create Goal',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ),
        ),
      );
  }

  Future<void> saveGoal(String target) async{
    await DatabaseController().saveGoalInDatabase(
        selectedInterval,
        target,
        widget.activity
    );
  }

  Widget buildCustomRadio(String label, String value) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedInterval = value;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: selectedInterval == value ? Colors.pinkAccent : Colors.white30,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
