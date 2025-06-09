import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/styles.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/routes_manager/routes.dart';
import '../../../../core/widget/custom_elevated_button.dart';
import '../../../../core/widget/main_text_field.dart';
import '../../../../core/widget/validators.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  SizedBox(height: 10.h),
                  CustomElevatedButton(onTap: () {}, label: 'Save Password'),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.Congratulations);
                    },
                    child: Text(
                      "go to congratulations",
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
