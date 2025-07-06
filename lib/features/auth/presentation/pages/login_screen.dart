import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markti/core/constants/colors.dart';
import 'package:markti/core/constants/styles.dart';
import 'package:markti/core/di/di.dart';
import 'package:markti/core/routes_manager/routes.dart';
import 'package:markti/features/auth/presentation/manager/auth_cubit.dart';

import '../../../../core/cache/secure_storage.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/widget/custom_elevated_button.dart';
import '../../../../core/widget/main_text_field.dart';
import '../../../../core/widget/validators.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthCubit loginCubit = getIt<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      bloc: loginCubit,
      listener: (context, state)async {
        if (state is LoginLoading) {
          EasyLoading.show(status: "Loading");
        } else if (state is LoginError) {
          EasyLoading.dismiss();
          EasyLoading.showError(state.errorMessage.messageEn ?? "error");
        } else if (state is LoginSuccess) {
          EasyLoading.dismiss();
          EasyLoading.showSuccess("Login success");
          await secureStorage.write(key: "token", value: state.loginResponseEntity.token);
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.homePage,
            (route) => false,
          );
        }
      },
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 80.h),
                  Image.asset(
                    "assets/images/Logo_Splash_Screen.png",
                    width: 272.w,
                    height: 232.h,
                  ),
                  SizedBox(height: 32.h),
                  BuildTextField(
                    prefixIcon: Icon(Icons.email_outlined),
                    hint: "Username or Email",
                    controller: loginCubit.emailLoginController,
                    labelTextStyle: textStyles.font12grayRegular,
                    backgroundColor: appColors.KPwhite,
                    borderBackgroundColor: appColors.KPnavy,
                    validation: AppValidators.validateEmail,
                    textInputType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 14.h),
                  BuildTextField(
                    prefixIcon: Icon(Icons.password),
                    hint: "Password",
                    controller: loginCubit.passwordLoginController,
                    labelTextStyle: textStyles.font12grayRegular,
                    backgroundColor: appColors.KPwhite,
                    borderBackgroundColor: appColors.KPnavy,
                    validation: AppValidators.validatePassword,
                    isObscured: true,
                    textInputType: TextInputType.text,
                  ),
                  Row(
                    children: [
                      CheckBox(),
                      Text("Remember Me", style: textStyles.font12navyMedium),
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context,
                              Routes.forgetPasswordEmail);
                        },
                        child: Text(
                          "Forgot Password",
                          style: textStyles.font12primaryMedium,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 21.h),
                  CustomElevatedButton(onTap: () {
                    loginCubit.Login();
                  }, label: 'Log In'),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Or Continue With",
                          style: textStyles.font12navyMedium),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset(ImageAssets.google)
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset(ImageAssets.apple)
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset(ImageAssets.facebook)
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Are you new in Marketi",
                        style: textStyles.font12navyMedium,),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.signUp);
                        },
                        child: Text(
                          "register ?",
                          style: textStyles.font12primaryMedium,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CheckBox extends StatefulWidget {
  const CheckBox({super.key});

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool rememberMe = false;

  void _onRememberMeChanged(bool? newValue) {
    if (newValue == null) return;

    setState(() {
      rememberMe = newValue;

      if (rememberMe) {
        // TODO: Add your logic to remember the user.
      } else {
        // TODO: Add your logic to forget the user.
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: rememberMe,
      onChanged: _onRememberMeChanged,
    );
  }
}


