import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markti/core/di/di.dart';
import 'package:markti/features/auth/presentation/manager/auth_cubit.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/styles.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/routes_manager/routes.dart';
import '../../../../core/widget/custom_elevated_button.dart';
import '../../../../core/widget/main_text_field.dart';
import '../../../../core/widget/validators.dart';

class ForgetPasswordByEmailScreen extends StatelessWidget {
  ForgetPasswordByEmailScreen({super.key});

  AuthCubit forgetPasswordCubit = getIt<AuthCubit>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      bloc: forgetPasswordCubit,
      listener: (context, state) {
        if (state is SendResetPasswordLoading) {
          // Show loading indicator
          EasyLoading.show(status: "Loading");
        } else if (state is SendResetPasswordError) {
          EasyLoading.dismiss();
          EasyLoading.showError(state.errorMessage.messageEn ?? "error");
        } else if (state is SendResetPasswordSuccess) {
          EasyLoading.dismiss();
          EasyLoading.showSuccess("Login success");
          Navigator.pushNamed(context, Routes.code,arguments: forgetPasswordCubit.emailForgetPasswordController.text);
        }
      },
      child: Form(
        key: _formKey,
        child: Scaffold(
          appBar: AppBar(title: const Text("Forgot Password")),
          body: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(ImageAssets.forgetPassword2),
                      const SizedBox(height: 22),
                      Text(
                        "Please enter your email address to\n     receive a verification code",
                        style: textStyles.font14navyMedium,
                      ),
                      SizedBox(height: 10.h),
                      BuildTextField(
                        prefixIcon: Icon(Icons.email_outlined),
                        label: "Email",
                        hint: "You@gmail.com",
                        controller: forgetPasswordCubit.emailForgetPasswordController,
                        labelTextStyle: textStyles.font12grayRegular,
                        backgroundColor: appColors.KPwhite,
                        borderBackgroundColor: appColors.KPnavy,
                        validation: AppValidators.validateEmail,
                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 10.h),
                  CustomElevatedButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        print("Email: ${forgetPasswordCubit.emailForgetPasswordController.text}");
                        forgetPasswordCubit.sendResetPassword();
                      }
                    },
                    label: 'Send Code',
                  )                      // TextButton(
                      //   onPressed: () {
                      //     Navigator.pushNamed(context, Routes.code);
                      //   },
                      //   child: Text(
                      //     "go verify code",
                      //     style: textStyles.font16blueSemiBold,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
