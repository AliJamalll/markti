// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:markti/core/constants/styles.dart';
// import 'package:markti/core/resources/assets_manager.dart';
// import 'package:markti/core/routes_manager/routes.dart';
//
// import '../../../../core/constants/colors.dart';
// import '../../../../core/widget/custom_elevated_button.dart';
// import '../../../../core/widget/main_text_field.dart';
// import '../../../../core/widget/validators.dart';
//
// class ForgetPasswordScreen extends StatelessWidget {
//   const ForgetPasswordScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Forgot Password")),
//       body: SafeArea(
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(ImageAssets.forgetPassword),
//                   const SizedBox(height: 22),
//                   Text(
//                     "Please enter your phone number to\n        receive a verification code",
//                     style: textStyles.font14navyMedium,
//                   ),
//                   SizedBox(height: 10.h),
//                   BuildTextField(
//                     prefixIcon: Icon(Icons.phone),
//                     label: "Phone Number",
//                     hint: "Phone Number",
//                     labelTextStyle: textStyles.font12grayRegular,
//                     backgroundColor: appColors.KPwhite,
//                     borderBackgroundColor: appColors.KPnavy,
//                     validation: AppValidators.validatePhoneNumber,
//                     textInputType: TextInputType.phone,
//                   ),
//                   SizedBox(height: 10.h),
//                   CustomElevatedButton(onTap: () {}, label: 'Send Code'),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pushNamed(context, Routes.forgetPasswordEmail);
//                     },
//                     child: Text(
//                       "Try Another Way",
//                       style: textStyles.font16blueSemiBold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
