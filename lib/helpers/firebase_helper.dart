import 'dart:async';

import 'package:budgetbuddy_bloc/constants/firebase_collection_paths.dart';
import 'package:budgetbuddy_bloc/models/transactions_model.dart';
import 'package:budgetbuddy_bloc/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseHelper {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  late UserModel userData;

  Future<void> insertUserRecord(UserModel user) async {
    _firebaseFirestore
        .collection(FirebaseCollectionPaths.users)
        .doc(_firebaseAuth.currentUser!.uid)
        .set(
          user.toJson(),
        );
  }

  Future<UserModel> getSelfData() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshotData =
          await _firebaseFirestore
              .collection(FirebaseCollectionPaths.users)
              .doc(_firebaseAuth.currentUser!.uid)
              .get();
      userData = UserModel.fromJson(snapshotData.data()!);
      return userData;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> addTranscations(TransactionModel transaction) async {
    _firebaseFirestore
        .collection(FirebaseCollectionPaths.users)
        .doc(_firebaseAuth.currentUser!.uid)
        .collection(FirebaseCollectionPaths.transactions)
        .doc()
        .set(
          transaction.toJson(),
        )
        .timeout(const Duration(seconds: 10), onTimeout: () {
      throw TimeoutException("Server request timeout");
    });
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
    return;
  }
}
