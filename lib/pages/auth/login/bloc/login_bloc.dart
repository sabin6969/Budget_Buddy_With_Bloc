import 'package:budgetbuddy_bloc/helpers/firebase_helper.dart';
import 'package:budgetbuddy_bloc/models/user_model.dart';
import 'package:budgetbuddy_bloc/repository/firebase_auth_repository.dart';
import 'package:budgetbuddy_bloc/services/firebase_auth_services.dart';
import 'package:budgetbuddy_bloc/utils/email_validation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> with EmailValidation {
  final FirebaseAuthRepository _authRepository = FirebaseAuthRepository(
    firebaseAuthServices: FirebaseAuthServices(),
  );
  FirebaseHelper firebaseHelper = FirebaseHelper();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressed>(logInWithEmailAndPassword);
    on<LoginWithGoogleButtonPressed>(loginWithGoogle);
  }

  Future<void> logInWithEmailAndPassword(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    if (event.email.isEmpty || event.password.isEmpty) {
      emit(LoginFailed(message: "Both Fields are required"));
      return;
    }
    if (!isEmailValid(event.email)) {
      emit(LoginFailed(message: "Enter a valid email"));
      return;
    }

    try {
      emit(LoginLoading());
      await _authRepository.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      emit(LoginInitial());
      emit(LoginSucess());
    } catch (e) {
      emit(LoginInitial());
      if (e is FirebaseAuthException) {
        emit(LoginFailed(message: e.message ?? "Authentication error"));
      } else {
        emit(LoginFailed(message: e.toString()));
      }
    }
  }

  loginWithGoogle(
      LoginWithGoogleButtonPressed event, Emitter<LoginState> emit) async {
    try {
      emit(LoginLoading());
      await _authRepository.signupWithGoogle();
      firebaseHelper.insertUserRecord(UserModel(
        email: firebaseAuth.currentUser!.email!,
        userName: firebaseAuth.currentUser!.displayName!,
        profileImageUrl: firebaseAuth.currentUser!.photoURL!,
      ));
      emit(LoginInitial());
      emit(LoginSucess());
    } on FirebaseAuthException catch (e) {
      emit(LoginInitial());
      emit(LoginFailed(message: e.message ?? "An error occured"));
    } catch (e) {
      emit(LoginInitial());
      emit(LoginFailed(
        message: "User terminated google sign in",
      ));
    }
  }
}
