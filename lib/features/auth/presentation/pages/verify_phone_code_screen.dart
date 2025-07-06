// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../../core/constants/styles.dart';
// import '../../../../core/resources/assets_manager.dart';
// import '../../../../core/routes_manager/routes.dart';
// import '../../../../core/widget/custom_elevated_button.dart';
// import 'package:flutter_verification_code/flutter_verification_code.dart';
//
// class VerifyCodeScreen extends StatefulWidget {
//   const VerifyCodeScreen({super.key});
//
//   @override
//   State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
// }
//
//
// class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
//   bool _onEditing = true;
//   String? _code;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Verification Code")),
//       body: SafeArea(
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(ImageAssets.forgetPassword3),
//                   const SizedBox(height: 22),
//                   Text(
//                     "Please enter the 4 digit code\n    sent to: +20 1501142409 ",
//                     style: textStyles.font14navyMedium,
//                   ),
//                   SizedBox(height: 10.h),
//                   VerificationCode(
//                     textStyle: TextStyle(fontSize: 20.0, color: Colors.red[900]),
//                     keyboardType: TextInputType.number,
//                     underlineColor: Colors.amber, // If this is null it will use primaryColor: Colors.red from Theme
//                     length: 4,
//                     cursorColor: Colors.blue, // If this is null it will default to the ambient
//                     // clearAll is NOT required, you can delete it
//                     // takes any widget, so you can implement your design
//                     clearAll: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         'clear all',
//                         style: TextStyle(fontSize: 14.0, decoration: TextDecoration.underline, color: Colors.blue[700]),
//                       ),
//                     ),
//                     onCompleted: (String value) {
//                       setState(() {
//                         _code = value;
//                       });
//                     },
//                     onEditing: (bool value) {
//                       setState(() {
//                         _onEditing = value;
//                       });
//                       if (!_onEditing) FocusScope.of(context).unfocus();
//                     },
//                   ),
//                   SizedBox(height: 10.h),
//                   CustomElevatedButton(onTap: () {}, label: 'Verify Code'),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pushNamed(context, Routes.CreateNewPassword);
//                     },
//                     child: Text(
//                       "resend code",
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
//
// }
