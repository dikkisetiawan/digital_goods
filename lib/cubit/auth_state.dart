part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final LoginModel login;

  AuthSuccess(this.login);

  @override
  List<Object> get props => [login];
}

class FetchUserProfileSuccess extends AuthState {
  final UserModel userProfileData;

  FetchUserProfileSuccess(this.userProfileData);

  @override
  List<Object> get props => [userProfileData];
}

class FetchUserProfileFailed extends AuthState {
  final String error;

  FetchUserProfileFailed(this.error);

  @override
  List<Object> get props => [error];
}

class AuthFailed extends AuthState {
  final String error;

  AuthFailed(this.error);

  @override
  List<Object> get props => [error];
}
