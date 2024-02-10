import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> signInWithEmailAndPassword(
      {required String email, required String password}) {
    try {
      return _auth
          .signInWithEmailAndPassword(
            email: email,
            password: password,
          )
          .timeout(
            const Duration(seconds: 10),
            onTimeout: () => throw TimeoutException("Server Request Timeout"),
          );
    } catch (e) {
      print("An erorr occured");
      throw Exception(e.toString());
    }
  }
}
