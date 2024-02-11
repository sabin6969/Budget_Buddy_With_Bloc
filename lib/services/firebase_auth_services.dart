import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign in with email and password
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
      throw Exception(e.toString());
    }
  }

  // Send reset email link
  Future sendResetEmailLink(String email) async {
    try {
      await _auth
          .sendPasswordResetEmail(email: email)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("Server request timeout");
      });
      return;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Sign up or create new account
  Future signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("Server request timeout");
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
