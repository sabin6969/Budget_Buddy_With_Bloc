import 'package:budgetbuddy_bloc/services/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepository {
  final FirebaseAuthServices firebaseAuthServices;
  FirebaseAuthRepository({required this.firebaseAuthServices});

  Future<UserCredential> signInWithEmailAndPassword(
      {required String email, required String password}) {
    return firebaseAuthServices.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> sendResetEmailLink({required String email}) async {
    await firebaseAuthServices.sendResetEmailLink(email);
  }

  Future<void> createAccountWithEmailAndPassword(
      {required String email, required String password}) async {
    await firebaseAuthServices.signUpWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
