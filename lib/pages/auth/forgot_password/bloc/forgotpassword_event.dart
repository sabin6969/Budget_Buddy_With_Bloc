part of 'forgotpassword_bloc.dart';

sealed class ForgotpasswordEvent {}

class ForgotPasswordButtonPressed extends ForgotpasswordEvent {
  final String email;
  ForgotPasswordButtonPressed({required this.email});
}
