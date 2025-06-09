import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markti/core/constants/colors.dart';
import 'package:markti/core/constants/styles.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/widget/custom_elevated_button.dart';
import '../../../../core/widget/main_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
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
                labelTextStyle: textStyles.font12grayRegular,
                backgroundColor: appColors.KPwhite,
                borderBackgroundColor: appColors.KPnavy,
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 14.h),
              BuildTextField(
                prefixIcon: Icon(Icons.password),
                hint: "Password",
                labelTextStyle: textStyles.font12grayRegular,
                backgroundColor: appColors.KPwhite,
                borderBackgroundColor: appColors.KPnavy,
                isObscured: true,
                textInputType: TextInputType.text,
              ),
              Row(
                children: [
                  CheckBox(),
                  Text("Remember Me", style: textStyles.font12navyMedium),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password",
                      style: textStyles.font12primaryMedium,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 21.h),
              CustomElevatedButton(onTap: () {}, label: 'Log In'),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Or Continue With", style: textStyles.font12navyMedium),
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
                  Text("Are you new in Marketi",style: textStyles.font12navyMedium,),
                  TextButton(
                    onPressed: () {},
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


