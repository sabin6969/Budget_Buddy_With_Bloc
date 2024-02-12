part of 'profile_bloc.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  final UserModel userModel;

  ProfileLoaded({required this.userModel});
}

final class ProfileLoadingErorr extends ProfileState {
  final String message;

  ProfileLoadingErorr({required this.message});
}
