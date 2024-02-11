part of 'signup_bloc.dart';

sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSucess extends SignupState {}

final class SignupFailed extends SignupState {
  final String message;

  SignupFailed({required this.message});
}
