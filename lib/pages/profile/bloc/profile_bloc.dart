import 'package:budgetbuddy_bloc/helpers/firebase_helper.dart';
import 'package:budgetbuddy_bloc/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final FirebaseHelper _firebaseHelper = FirebaseHelper();
  late UserModel userModel;
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileLoad>(loadProfileData);
  }

  loadProfileData(ProfileLoad event, Emitter<ProfileState> emit) async {
    try {
      emit(ProfileLoading());
      userModel = await _firebaseHelper.getSelfData();
      emit(ProfileLoaded(userModel: userModel));
    } catch (e) {
      emit(ProfileLoadingErorr(message: "Failed to load your profile"));
    }
  }
}
