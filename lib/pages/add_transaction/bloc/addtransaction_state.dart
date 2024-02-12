part of 'addtransaction_bloc.dart';

sealed class AddtransactionState {}

final class AddtransactionInitial extends AddtransactionState {}

final class AddtransactionSucess extends AddtransactionState {}

final class AddtransactionLoading extends AddtransactionState {}

final class AddtransactionFailed extends AddtransactionState {
  final String message;

  AddtransactionFailed({required this.message});
}
