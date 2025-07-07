import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:markti/core/failures/failure.dart';
import 'package:markti/features/auth/domain/entities/login_response_entity.dart';
import 'package:markti/features/auth/domain/entities/register_repspons_intity.dart';
import 'package:markti/features/auth/domain/use_cases/active_reset_password_usecase.dart';
import 'package:markti/features/auth/domain/use_cases/login_usecase.dart';
import 'package:markti/features/auth/domain/use_cases/new_password_usecase.dart';
import 'package:markti/features/auth/domain/use_cases/register_usecase.dart';
import 'package:markti/features/auth/domain/use_cases/send_password_email.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/active_reset_password_response_entity.dart';
import '../../domain/entities/new_password_response_entity.dart';
import '../../domain/entities/send_password_email_entity.dart';

part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
      {required this.registerUseCase, required this.loginUseCase, required this.sendPasswordEmailUseCase, required this.activeResetPasswordUseCase, required this.newPasswordUseCase,})
      : super(AuthInitial());
  RegisterUseCase registerUseCase;
  LoginUseCase loginUseCase;
  SendPasswordEmailUseCase sendPasswordEmailUseCase;
  ActiveResetPasswordUseCase activeResetPasswordUseCase;
  NewPasswordUseCase newPasswordUseCase;

  ///for register
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  ///for login
  TextEditingController emailLoginController = TextEditingController(
      text: "aloaaa971@gmail.com");
  TextEditingController passwordLoginController = TextEditingController(
      text: "As@123456");

  ///for forget password
  TextEditingController emailForgetPasswordController = TextEditingController(
      text: "aloaaa971@gmail.com");

  ///for active reset password
  TextEditingController emailActiveResetPasswordController = TextEditingController(
      text: "aloaaa971@gmail.com");
  TextEditingController codeActiveResetPasswordController = TextEditingController();
  TextEditingController messageActiveResetPasswordController = TextEditingController();

  ///for new password
  TextEditingController email = TextEditingController(
      text: "aloaaa971@gmail.com");
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  void Register() async {
    emit(RegisterLoading());
    var either = await registerUseCase.invoke(
      userNameController.text,
      emailController.text,
      phoneController.text,
      passwordController.text,
      confirmPasswordController.text,
    );

    either.fold(
          (e) => {emit(RegisterError(errorMessage: e))},
          (r) => {emit(RegisterSuccess(registerResponseEntity: r))},
    );
  }

  void Login() async {
    emit(LoginLoading());
    var either = await loginUseCase.invoke(
      emailLoginController.text,
      passwordLoginController.text,
    );
    either.fold(
          (e) => {emit(LoginError(errorMessage: e))},
          (r) => {emit(LoginSuccess(loginResponseEntity: r))},
    );
  }

  void sendResetPassword() async {
    emit(SendResetPasswordLoading());
    var eihter = await sendPasswordEmailUseCase.invoke(
        emailForgetPasswordController.text);
    eihter.fold((e) =>
    {
      emit(SendResetPasswordError(errorMessage: e))
    }, (r) =>
    {
      emit(SendResetPasswordSuccess(sendPasswordEmailEntity: r))
    });
  }

  void activeResetPassword() async {
    emit(ActiveResetPasswordLoading());
    var either = await activeResetPasswordUseCase.invoke(
        emailActiveResetPasswordController.text,
        codeActiveResetPasswordController.text,
        messageActiveResetPasswordController.text);
    either.fold((e) =>
    {
      emit(ActiveResetPasswordError(errorMessage: e))
    }, (r) =>
    {
      emit(ActiveResetPasswordSuccess(activeResetPasswordResponseEntity: r))
    });
  }

  void newPassword() async {
    emit(NewPasswordLoading());
    var either = await newPasswordUseCase.invoke(email.text, password.text, confirmPassword.text);
    either.fold((e) => {
      emit(NewPasswordError(errorMessage: e))
    }, (r)=> {
      emit(NewPasswordSuccess(newPasswordResponseEntity: r))
    });
  }
}
