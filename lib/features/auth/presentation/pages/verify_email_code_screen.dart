import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/styles.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/routes_manager/routes.dart';
import '../../../../core/widget/custom_elevated_button.dart';

class VerifyEmailCodeScreen extends StatelessWidget {
  const VerifyEmailCodeScreen({super.key});

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
                  Image.asset(ImageAssets.forgetPassword3),
                  const SizedBox(height: 22),
                  Text(
                    "Please enter the 4 digit code\n    sent to: email ",
                    style: textStyles.font14navyMedium,
                  ),
                  SizedBox(height: 10.h),
                  CustomElevatedButton(onTap: () {}, label: 'Verify Code'),
                  TextButton(
                    onPressed: () {
                    },
                    child: Text(
                      "resend code",
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
