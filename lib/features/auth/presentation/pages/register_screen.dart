import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/styles.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/routes_manager/routes.dart';
import '../../../../core/widget/custom_elevated_button.dart';
import '../../../../core/widget/main_text_field.dart';
import '../../../../core/widget/validators.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back_ios_new),
                        ),
                        Spacer(flex: 1),
                        SizedBox(width: 20.w),
                        Image.asset(
                          ImageAssets.splash,
                          width: 100.w,
                          height: 100.h,
                        ),
                        Spacer(flex: 2),
                      ],
                    ),
                    SizedBox(height: 1.h),
                    BuildTextField(
                      prefixIcon: Icon(Icons.drive_file_rename_outline),
                      label: "Your Name",
                      hint: "Full Name",
                      labelTextStyle: textStyles.font12grayRegular,
                      backgroundColor: appColors.KPwhite,
                      borderBackgroundColor: appColors.KPnavy,
                      textInputType: TextInputType.name,
                    ),
                    SizedBox(height: 10.h),
                    BuildTextField(
                      prefixIcon: Icon(Icons.drive_file_rename_outline),
                      label: "Username",
                      hint: "Username",
                      labelTextStyle: textStyles.font12grayRegular,
                      backgroundColor: appColors.KPwhite,
                      borderBackgroundColor: appColors.KPnavy,
                      validation: AppValidators.validateUsername,
                      textInputType: TextInputType.name,
                    ),
                    SizedBox(height: 10.h),
                    BuildTextField(
                      prefixIcon: Icon(Icons.phone),
                      label: "Phone Number",
                      hint: "Phone Number",
                      labelTextStyle: textStyles.font12grayRegular,
                      backgroundColor: appColors.KPwhite,
                      borderBackgroundColor: appColors.KPnavy,
                      validation: AppValidators.validatePhoneNumber,
                      textInputType: TextInputType.phone,
                    ),
                    SizedBox(height: 10.h),
                    BuildTextField(
                      prefixIcon: Icon(Icons.email_outlined),
                      label: "Email",
                      hint: "You@gmail.com",
                      labelTextStyle: textStyles.font12grayRegular,
                      backgroundColor: appColors.KPwhite,
                      borderBackgroundColor: appColors.KPnavy,
                      validation: AppValidators.validateEmail,
                      textInputType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 10.h),
                    BuildTextField(
                      prefixIcon: Icon(Icons.password),
                      hint: "Password",
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
                      labelTextStyle: textStyles.font12grayRegular,
                      backgroundColor: appColors.KPwhite,
                      borderBackgroundColor: appColors.KPnavy,
                      validation: AppValidators.validatePassword,
                      isObscured: true,
                      textInputType: TextInputType.text,
                    ),
                    SizedBox(height: 21.h),
                    CustomElevatedButton(onTap: () {}, label: 'Sign Up'),
                    SizedBox(height: 12.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Or Continue With",
                          style: textStyles.font12navyMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(ImageAssets.google),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(ImageAssets.apple),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(ImageAssets.facebook),
                        ),
                      ],
                    ),
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
