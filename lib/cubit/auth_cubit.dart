import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/auth_service.dart';
import '/models/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void login({required String email, required String password}) async {
    try {
      emit(AuthLoading());

      LoginModel login =
          await AuthService().login(email: email, password: password);

      emit(AuthSuccess(login));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
