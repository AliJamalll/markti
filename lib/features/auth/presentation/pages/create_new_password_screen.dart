import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markti/features/auth/presentation/manager/auth_cubit.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/styles.dart';
import '../../../../core/di/di.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/routes_manager/routes.dart';
import '../../../../core/widget/custom_elevated_button.dart';
import '../../../../core/widget/main_text_field.dart';
import '../../../../core/widget/validators.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  CreateNewPasswordScreen({super.key});

  AuthCubit newPasswordCubit = getIt<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      bloc: newPasswordCubit,
      listener: (context, state) {
        if(state is NewPasswordLoading){
          EasyLoading.show(status: "Loading");
        }else if(state is NewPasswordError){
          EasyLoading.dismiss();
          EasyLoading.showError(state.errorMessage.messageEn ?? "error");
        }else if(state is NewPasswordSuccess){
          EasyLoading.dismiss();
          EasyLoading.showSuccess("new password success");
          Navigator.pushNamedAndRemoveUntil(context,
              Routes.Congratulations,
                  (route) => false
          );
        }
        },
      child: Scaffold(
        appBar: AppBar(title: const Text("Create New Password")),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(ImageAssets.forgetPasswordCreateNew),
                    const SizedBox(height: 22),
                    Text(
                      "\t\t\t\tNew password must be\ndifferent from last password",
                      style: textStyles.font14navyMedium,
                    ),
                    SizedBox(height: 10.h),
                    BuildTextField(
                      prefixIcon: Icon(Icons.password),
                      hint: "Password",
                      controller: newPasswordCubit.password,
                      labelTextStyle: textStyles.font12grayRegular,
                      backgroundColor: appColors.KPwhite,
                      borderBackgroundColor: appColors.KPnavy,
                      validation: AppValidators.validatePassword,
                      isObscured: true,
                      textInputType: TextInputType.text,
                    ),
                    SizedBox(height: 10.h),
                    BuildTextField(
                      prefixIcon: Icon(Icons.password),
                      hint: "Confirm Password",
                      controller: newPasswordCubit.confirmPassword,
                      labelTextStyle: textStyles.font12grayRegular,
                      backgroundColor: appColors.KPwhite,
                      borderBackgroundColor: appColors.KPnavy,
                      validation: AppValidators.validatePassword,
                      isObscured: true,
                      textInputType: TextInputType.text,
                    ),
                    SizedBox(height: 10.h),
                    CustomElevatedButton(onTap: () {
                      newPasswordCubit.newPassword();
                    }, label: 'Save Password'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
