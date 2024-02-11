part of 'signup_bloc.dart';

sealed class SignupEvent {}

class SignupButtonPressed extends SignupEvent {
  final String name;
  final String email;
  final String password;
  final bool isChecked;

  SignupButtonPressed({
    required this.name,
    required this.email,
    required this.password,
    required this.isChecked,
  });
}

class SignupWithGoogleButtonPressed extends SignupEvent {}
