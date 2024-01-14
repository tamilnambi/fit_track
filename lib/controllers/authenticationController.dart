import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationController{

  final auth = FirebaseAuth.instance;

  Future logInWithDetails(String email, String password) async{
    try {
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

  Future<void> createAccount(String email, String password) async{
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    }
    on FirebaseAuthException catch(e){
      print('tamil $e');
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
}