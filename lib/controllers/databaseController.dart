import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_track/data/constants.dart';
import 'package:intl/intl.dart';

class DatabaseController {
  final userDetails = FirebaseFirestore.instance.collection('user_details');

  Future<void> setUsername(String username, String email) async {
    await userDetails.doc(email).set({"username": username});
  }

  Future<String> getUsername(String email) async {
    try {
      final user = await userDetails.doc(email).get();
      if (user.exists) {
        // The document exists, retrieve the 'username' field
        Map<String, dynamic> userData = user.data() as Map<String, dynamic>;
        String username = userData['username'];
        print('Username: $username');
        return username;
      } else {
        print('Document does not exist');
        return 'user';
      }
    } catch (e) {
      print('Error while getting the username $e');
      return 'user';
    }
  }

  Future<void> saveGoalInDatabase(
      String duration, String target, String activity) async {
    try {
      final startingDate = getDate();
      CollectionReference goals = FirebaseFirestore.instance
          .collection('user_details')
          .doc(userEmail)
          .collection('goals');
      await goals.add({
        'activity_type': activity,
        'starting_date': startingDate,
        'target': target,
        'duration': duration,
      });
    } catch (e) {
      print('Error adding goal to Firestore: $e');
    }
  }

  String getDate() {
    // Get today's date without the time
    DateTime today = DateTime.now();
    DateTime todayWithoutTime = DateTime(today.year, today.month, today.day);

    // Format the date as "yyyy-MM-dd"
    String formattedDate = DateFormat('yyyy-MM-dd').format(todayWithoutTime);
    return formattedDate;
  }
}
