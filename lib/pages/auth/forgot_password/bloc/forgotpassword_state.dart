part of 'forgotpassword_bloc.dart';

sealed class ForgotpasswordState {}

final class ForgotpasswordInitial extends ForgotpasswordState {}

final class ForgotpasswordLoading extends ForgotpasswordState {}

final class ForgotpasswordEmailSentSucess extends ForgotpasswordState {
  final String message;
  ForgotpasswordEmailSentSucess({required this.message});
}

final class FogetPasswordEmailSentFailed extends ForgotpasswordState {
  final String message;
  FogetPasswordEmailSentFailed({required this.message});
}
