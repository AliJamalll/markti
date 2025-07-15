import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markti/core/constants/colors.dart';

class CustomProfileFeatures extends StatelessWidget {
   CustomProfileFeatures({super.key,required this.text,required this.firstIcon,required this.lastIcon,required this.onPressed});

  final Widget? firstIcon;
  final Widget? lastIcon;
  final VoidCallback onPressed;
  final Text? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: double.infinity,
      decoration:BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        //border: Border.all(color: appColors.KPprimary,width: 1.w),
      ),
      child: Row(
        children: [
          firstIcon!,
          SizedBox(width: 10.w,),
          text!,
          Spacer(),
          IconButton(onPressed: onPressed, icon: lastIcon!)
        ],
      ),
    );
  }
}
