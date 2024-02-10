part of 'login_bloc.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginSucess extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginFailed extends LoginState {
  final String message;
  LoginFailed({required this.message});
}
