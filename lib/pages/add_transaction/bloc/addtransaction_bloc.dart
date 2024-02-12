import 'package:budgetbuddy_bloc/helpers/firebase_helper.dart';
import 'package:budgetbuddy_bloc/models/transactions_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'addtransaction_event.dart';
part 'addtransaction_state.dart';

class AddtransactionBloc
    extends Bloc<AddtransactionEvent, AddtransactionState> {
  final FirebaseHelper _firebaseHelper = FirebaseHelper();
  AddtransactionBloc() : super(AddtransactionInitial()) {
    on<AddTransactionEvent>(addTransaction);
  }
  addTransaction(
      AddTransactionEvent event, Emitter<AddtransactionState> emit) async {
    if (event.transactionModel.title!.isEmpty ||
        event.transactionModel.amount == null) {
      emit(AddtransactionFailed(
          message: "All fields are required with proper type"));
    } else {
      try {
        emit(AddtransactionLoading());
        await _firebaseHelper.addTranscations(event.transactionModel);
        emit(AddtransactionSucess());
      } catch (e) {
        emit(AddtransactionFailed(message: e.toString()));
      }
    }
  }
}
