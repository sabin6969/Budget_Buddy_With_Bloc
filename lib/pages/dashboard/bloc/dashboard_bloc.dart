import 'package:budgetbuddy_bloc/helpers/firebase_helper.dart';
import 'package:budgetbuddy_bloc/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final FirebaseHelper _firebaseHelper = FirebaseHelper();
  late Stream<QuerySnapshot<Map<String, dynamic>>> transactionStreams;
  late UserModel userData;

  DashboardBloc() : super(DashboardInitial()) {
    on<LoadDashboardDataEvent>(loadDashboardData);
    on<ResetDashboardEvent>((event, emit) {
      emit(DashboardInitial());
    });
  }

  loadDashboardData(
      LoadDashboardDataEvent event, Emitter<DashboardState> emit) async {
    try {
      emit(DashboardLoadingState());
      transactionStreams = _firebaseHelper.getAllTransactions();
      userData = await _firebaseHelper.getSelfData();
      emit(
        DashboardLoadedState(
          transactionStreams: transactionStreams,
          userData: userData,
        ),
      );
    } catch (e) {
      emit(DashboardErrorState(message: e.toString()));
    }
  }
}
