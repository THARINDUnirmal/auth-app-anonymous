import 'package:auth_app_anonymous/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthSevices {
  //create Firebase auth instance
  final FirebaseAuth _authInstanse = FirebaseAuth.instance;

  Future<void> signAnonymous(BuildContext context) async {
    try {
      final UserCredential userCredential =
          await _authInstanse.signInAnonymously();

      final user = userCredential.user;

      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }

      if (user != null) {
        print("Sign in Anonymously ${user.uid}");
      } else {
        print(" Anonymously Sign in Failed");
      }
    } catch (error) {
      print(error.toString());
    }
  }

  User? getUserDetail() {
    return _authInstanse.currentUser;
  }
}
