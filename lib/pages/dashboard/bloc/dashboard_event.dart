part of 'dashboard_bloc.dart';

sealed class DashboardEvent {}

class LoadDashboardDataEvent extends DashboardEvent {}

class ResetDashboardEvent extends DashboardEvent {}
