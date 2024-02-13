part of 'profile_bloc.dart';

sealed class ProfileEvent {}

class ProfileLoad extends ProfileEvent {}

class ProfileUpdate extends ProfileEvent {}

class ProfileResetEvent extends ProfileEvent {}
