import 'package:budgetbuddy_bloc/helpers/firebase_helper.dart';
import 'package:budgetbuddy_bloc/models/user_model.dart';
import 'package:budgetbuddy_bloc/repository/firebase_auth_repository.dart';
import 'package:budgetbuddy_bloc/services/firebase_auth_services.dart';
import 'package:budgetbuddy_bloc/utils/email_validation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> with EmailValidation {
  final FirebaseAuthRepository _firebaseAuthRepository =
      FirebaseAuthRepository(firebaseAuthServices: FirebaseAuthServices());
  FirebaseHelper firebaseHelper = FirebaseHelper();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  SignupBloc() : super(SignupInitial()) {
    on<SignupButtonPressed>(createAccountWithEmailAndPassword);
    on<SignupWithGoogleButtonPressed>(signUpWithGoogle);
  }

  createAccountWithEmailAndPassword(
      SignupButtonPressed event, Emitter<SignupState> emit) async {
    if (!event.isChecked) {
      emit(SignupFailed(
          message: "Please agree to terms of service and privacy policy"));
      return;
    }
    if (event.name.isEmpty || event.email.isEmpty || event.password.isEmpty) {
      emit(SignupFailed(message: "All fields are required"));
      return;
    } else if (!isEmailValid(event.email)) {
      emit(SignupFailed(message: "Enter a valid email"));
      return;
    } else {
      if (event.password.length < 6) {
        emit(
            SignupFailed(message: "Enter a password with atleast 6 character"));
      } else {
        try {
          emit(SignupLoading());
          await _firebaseAuthRepository.createAccountWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
          // Inserting data into firestore as soon as user account is created
          firebaseHelper.insertUserRecord(
            UserModel(
              userName: event.name,
              email: event.email,
            ),
          );
          emit(SignupSucess());
        } on FirebaseAuthException catch (e) {
          emit(SignupInitial());
          emit(SignupFailed(message: e.message ?? "Failed to create account"));
        } catch (e) {
          emit(SignupInitial());
          emit(SignupFailed(message: e.toString()));
        }
      }
    }
  }

  signUpWithGoogle(
      SignupWithGoogleButtonPressed event, Emitter<SignupState> emit) async {
    try {
      emit(SignupLoading());
      await _firebaseAuthRepository.signupWithGoogle();
      // Inserting data into firestore as soon as user account is created
      firebaseHelper.insertUserRecord(UserModel(
        email: firebaseAuth.currentUser!.email!,
        userName: firebaseAuth.currentUser!.displayName!,
        profileImageUrl: firebaseAuth.currentUser!.photoURL!,
      ));
      emit(SignupInitial());
      emit(SignupSucess());
    } on FirebaseAuthException catch (e) {
      emit(SignupInitial());
      emit(SignupFailed(message: e.message ?? "An error occured"));
    } catch (e) {
      emit(SignupInitial());
      emit(SignupFailed(
        message: "User terminated google sign in",
      ));
    }
  }
}
