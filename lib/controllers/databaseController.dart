import 'package:cloud_firestore/cloud_firestore.dart';
class DatabaseController{

  final userDetails = FirebaseFirestore.instance.collection('user_details');

  Future<void> setUsername(String username, String email) async {

    await userDetails.doc(email).set({"username": username});
  }

  Future<String> getUsername(String email) async{
    try{
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
    }
    catch(e){
      print('Error while getting the username $e');
      return 'user';
    }
  }
}