part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

//SignUp_States
final class SignUpLoadingState extends AuthState {}

final class SignUpSuccessState extends AuthState {}

final class SignUpFailuerState extends AuthState {
  final String errMessage;

  SignUpFailuerState({required this.errMessage});
}

//SignIn_States
final class SignInLoadingState extends AuthState {}

final class SignInSuccessState extends AuthState {}

final class SignInFailuerState extends AuthState {
  final String errMessage;

  SignInFailuerState({required this.errMessage});
}

//Terms_and_Condition_State
//final class TermsAndConditionUpdateState extends AuthState {}

//Obscure_Password_State
final class ObscurePasswordTextUpdateState extends AuthState {}

//Reset_Password_States
final class ResetPasswordLoadingState extends AuthState {}

final class ResetPasswordSuccessState extends AuthState {}

final class ResetPasswordFailuerState extends AuthState {
  final String errMessage;

  ResetPasswordFailuerState({required this.errMessage});
}
