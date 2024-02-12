import 'package:budgetbuddy_bloc/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseHelper {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  late UserModel userData;

  Future<void> insertUserRecord(UserModel user) async {
    _firebaseFirestore
        .collection("users")
        .doc(_firebaseAuth.currentUser!.uid)
        .set(
          user.toJson(),
        );
  }

  Future<UserModel> getSelfData() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshotData =
          await _firebaseFirestore
              .collection("users")
              .doc(_firebaseAuth.currentUser!.uid)
              .get();
      userData = UserModel.fromJson(snapshotData.data()!);
      return userData;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
