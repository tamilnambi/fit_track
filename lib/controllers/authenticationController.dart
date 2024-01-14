import 'package:firebase_auth/firebase_auth.dart';

import '../data/constants.dart';
import 'databaseController.dart';

class AuthenticationController{

  final auth = FirebaseAuth.instance;
  final dbController = DatabaseController();

  Future logInWithDetails(String email, String password) async{
    try {
      userEmail = email;
      await auth.signInWithEmailAndPassword(
          email: email, password: password);
    }
    on FirebaseAuthException catch(e){
      print('tamil $e');
    }
  }

  Future<void> singOut() async{
    try{
      await auth.signOut();
    }
    on FirebaseAuthException catch(e){
      print('tamil $e');
    }
  }

  Future<bool> createAccount(String username,String email, String password) async{
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      await dbController.setUsername(username,email);
      return true;
    }
    on FirebaseAuthException catch(e){
      print('tamil $e');
      return false;
    }
  }

  Future<void> resetPassword(String email) async{
    try{
      await auth.sendPasswordResetEmail(email: email);
    }
    on FirebaseAuthException catch(e){
      print('tamil $e');
    }
  }

  Future<void> getUsername() async{
    username = await DatabaseController().getUsername(auth.currentUser!.email.toString());
  }
}