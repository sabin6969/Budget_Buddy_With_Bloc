import 'package:budgetbuddy_bloc/repository/firebase_auth_repository.dart';
import 'package:budgetbuddy_bloc/services/firebase_auth_services.dart';
import 'package:budgetbuddy_bloc/utils/email_validation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forgotpassword_event.dart';
part 'forgotpassword_state.dart';

class ForgotpasswordBloc extends Bloc<ForgotpasswordEvent, ForgotpasswordState>
    with EmailValidation {
  final FirebaseAuthRepository _authRepository =
      FirebaseAuthRepository(firebaseAuthServices: FirebaseAuthServices());
  ForgotpasswordBloc() : super(ForgotpasswordInitial()) {
    on<ForgotPasswordButtonPressed>(sendResetLink);
  }

  sendResetLink(ForgotPasswordButtonPressed event,
      Emitter<ForgotpasswordState> emit) async {
    if (event.email.isEmpty) {
      emit(FogetPasswordEmailSentFailed(message: "Enter a email"));
      return;
    }
    if (isEmailValid(event.email)) {
      try {
        emit(ForgotpasswordLoading());
        await _authRepository.sendResetEmailLink(email: event.email);
        emit(ForgotpasswordEmailSentSucess(
            message: "Email sent check your inbox"));
      } catch (e) {
        emit(ForgotpasswordInitial());
        if (e is FirebaseAuthException) {
          emit(FogetPasswordEmailSentFailed(
              message: e.message ?? "Error sending reset link"));
          return;
        }
        emit(FogetPasswordEmailSentFailed(message: e.toString()));
        return;
      }
    } else {
      emit(FogetPasswordEmailSentFailed(message: "Enter a valid email"));
    }
  }
}
