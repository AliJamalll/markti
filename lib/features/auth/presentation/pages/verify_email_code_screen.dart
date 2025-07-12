import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:markti/core/di/di.dart';
import 'package:markti/features/auth/presentation/manager/auth_cubit.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/constants/styles.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/routes_manager/routes.dart';
import '../../../../core/widget/custom_elevated_button.dart';

class VerifyEmailCodeScreen extends StatefulWidget {
  const VerifyEmailCodeScreen({super.key, required this.email});

  final String? email;

  @override
  State<VerifyEmailCodeScreen> createState() => _VerifyEmailCodeScreenState();
}


class _VerifyEmailCodeScreenState extends State<VerifyEmailCodeScreen> {
  StreamController<ErrorAnimationType> errorController = StreamController<
      ErrorAnimationType>();
  String currentText = "";
  TextEditingController textEditingController = TextEditingController();
  AuthCubit activeResetPassword = getIt<AuthCubit>();

  @override
  void initState() {
    super.initState();
    if (widget.email != null && widget.email!.isNotEmpty) {
      activeResetPassword.emailActiveResetPasswordController.text = widget.email!;
    }
  }


  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      bloc: activeResetPassword,
      listener: (context, state) {
        if(state is ActiveResetPasswordLoading){
          EasyLoading.show(status: "Loading");
        }else if(state is ActiveResetPasswordError){
          EasyLoading.dismiss();
          EasyLoading.showError(state.errorMessage.messageEn ?? "error");
        }else if(state is ActiveResetPasswordSuccess){
          EasyLoading.dismiss();
          EasyLoading.showSuccess("Active password success");
          Navigator.pushNamedAndRemoveUntil(context,
              Routes.CreateNewPassword,
                  (route) => false,arguments: activeResetPassword.emailActiveResetPasswordController.text
          );
        }
      },
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
                    Image.asset(ImageAssets.forgetPassword3),
                    const SizedBox(height: 22),
                    Text(
                      "\t\t\t\t\t\tPlease enter the 4 digit code\n    sent to:  ${widget
                          .email}",
                      style: textStyles.font14navyMedium,
                    ),
                    SizedBox(height: 10.h),
                    PinCodeTextField(
                      length: 6,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        activeFillColor: Colors.white,
                      ),
                      animationDuration: Duration(milliseconds: 300),
                      //backgroundColor: Colors.blue.shade50,
                      enableActiveFill: true,
                      errorAnimationController: errorController,
                      controller: activeResetPassword.codeActiveResetPasswordController,
                      onCompleted: (v) {
                        print("Completed");
                      },
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          currentText = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                      appContext: context,
                    ),
                    SizedBox(height: 10.h),
                    CustomElevatedButton(onTap: () {
                      print("EMAIL: ${activeResetPassword.emailActiveResetPasswordController.text}");
                      print("CODE: ${activeResetPassword.codeActiveResetPasswordController.text}");
                      activeResetPassword.activeResetPassword();
                    }, label: 'Verify Code'),
                    TextButton(
                      onPressed: () {
                        activeResetPassword.sendResetPassword();
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
      ),
    );
  }
}
