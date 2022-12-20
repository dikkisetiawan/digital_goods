import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/auth_service.dart';
import '/models/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static LoginModel? loginData;
  static UserModel? userProfileData;

  void login({required String email, required String password}) async {
    try {
      emit(AuthLoading());

      AuthCubit.loginData =
          await AuthService().login(email: email, password: password);

      print(loginData);
      emit(AuthSuccess(loginData!));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void fetchUserProfile() async {
    try {
      emit(AuthLoading());

      AuthCubit.userProfileData =
          await AuthService().fetchUserProfile(token: loginData!.accessToken!);

      emit(FetchUserProfileSuccess(userProfileData!));
    } catch (e) {
      emit(FetchUserProfileFailed(e.toString()));
    }
  }
}
