part of 'dashboard_bloc.dart';

sealed class DashboardState {}

final class DashboardInitial extends DashboardState {}

final class DashboardLoadedState extends DashboardState {
  final Stream<QuerySnapshot<Map<String, dynamic>>> transactionStreams;
  final UserModel userData;

  DashboardLoadedState(
      {required this.transactionStreams, required this.userData});
}

final class DashboardErrorState extends DashboardState {
  final String message;

  DashboardErrorState({required this.message});
}

final class DashboardLoadingState extends DashboardState {}
