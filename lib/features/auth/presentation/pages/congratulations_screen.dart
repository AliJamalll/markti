import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/styles.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/routes_manager/routes.dart';
import '../../../../core/widget/custom_elevated_button.dart';

class CongratulationsScreen extends StatelessWidget {
  const CongratulationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Verification Code")),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(ImageAssets.forgetPasswordCongratulations),
                  const SizedBox(height: 22),
                  Text(
                    "You have updated the password. please\n   login again with your latest password",
                    style: textStyles.font14navyMedium,
                  ),
                  SizedBox(height: 30.h),
                  CustomElevatedButton(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.signIn);
                    },
                    label: 'Log In',
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
