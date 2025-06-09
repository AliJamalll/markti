import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/styles.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/routes_manager/routes.dart';
import '../../../../core/widget/custom_elevated_button.dart';
import '../../../../core/widget/main_text_field.dart';
import '../../../../core/widget/validators.dart';

class ForgetPasswordByEmailScreen extends StatelessWidget {
  const ForgetPasswordByEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    labelTextStyle: textStyles.font12grayRegular,
                    backgroundColor: appColors.KPwhite,
                    borderBackgroundColor: appColors.KPnavy,
                    validation: AppValidators.validateEmail,
                    textInputType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 10.h),
                  CustomElevatedButton(onTap: () {}, label: 'Send Code'),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.code);
                    },
                    child: Text(
                      "go verify code",
                      style: textStyles.font16blueSemiBold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
