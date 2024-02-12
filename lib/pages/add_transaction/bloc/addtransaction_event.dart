part of 'addtransaction_bloc.dart';

sealed class AddtransactionEvent {}

class AddTransactionEvent extends AddtransactionEvent {
  final TransactionModel transactionModel;

  AddTransactionEvent({required this.transactionModel});
}
