part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

///for register
final class AuthInitial extends AuthState {}
final class RegisterLoading extends AuthState {}
final class RegisterSuccess extends AuthState {
  RegisterResponseEntity registerResponseEntity;
  RegisterSuccess({required this.registerResponseEntity});
}
final class RegisterError extends AuthState {
  Failure errorMessage;
  RegisterError({required this.errorMessage});
}

///for login
final class LoginLoading extends AuthState {}
final class LoginSuccess extends AuthState {
  LoginResponseEntity loginResponseEntity;
  LoginSuccess({required this.loginResponseEntity});
}
final class LoginError extends AuthState {
  Failure errorMessage;
  LoginError({required this.errorMessage});
}

///for reset password
final class SendResetPasswordLoading extends AuthState {}
final class SendResetPasswordSuccess extends AuthState {
  SendPasswordEmailEntity sendPasswordEmailEntity;
  SendResetPasswordSuccess({required this.sendPasswordEmailEntity});
}
final class SendResetPasswordError extends AuthState {
  Failure errorMessage;
  SendResetPasswordError({required this.errorMessage});
}

///for active reset password
final class ActiveResetPasswordLoading extends AuthState {}
final class ActiveResetPasswordSuccess extends AuthState {
  ActiveResetPasswordResponseEntity activeResetPasswordResponseEntity;
  ActiveResetPasswordSuccess({required this.activeResetPasswordResponseEntity});
}
final class ActiveResetPasswordError extends AuthState {
  Failure errorMessage;
  ActiveResetPasswordError({required this.errorMessage});
}

///new password
final class NewPasswordLoading extends AuthState {}
final class NewPasswordSuccess extends AuthState {
  NewPasswordResponseEntity newPasswordResponseEntity;
  NewPasswordSuccess({required this.newPasswordResponseEntity});
}
final class NewPasswordError extends AuthState {
  Failure errorMessage;
  NewPasswordError({required this.errorMessage});
}