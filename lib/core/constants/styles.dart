import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';
import 'font_wieght_helper.dart';

class textStyles{

  static TextStyle font20navySemiBold = GoogleFonts.poppins(
    textStyle: TextStyle(
        fontWeight: FontWeightHelper.semiBold,
        fontSize: 20.sp,
        color: appColors.KPnavy
    ),
  );
  static TextStyle font18whiteMedium = GoogleFonts.poppins(
    textStyle: TextStyle(
        fontWeight: FontWeightHelper.medium,
        fontSize: 18.sp,
        color: appColors.KPwhite
    ),
  );
  static TextStyle font16blueSemiBold = GoogleFonts.poppins(
    textStyle: TextStyle(
        fontWeight: FontWeightHelper.semiBold,
        fontSize: 16.sp,
        color: appColors.KPprimary
    ),
  );
  static TextStyle font14navyMedium = GoogleFonts.poppins(
    textStyle: TextStyle(
        fontWeight: FontWeightHelper.medium,
        fontSize: 14.sp,
        color: appColors.KPnavy
    ),
  );
  static TextStyle font12navyMedium = GoogleFonts.poppins(
    textStyle: TextStyle(
        fontWeight: FontWeightHelper.medium,
        fontSize: 12.sp,
        color: appColors.KPnavy
    ),
  );
  static TextStyle font12primaryMedium = GoogleFonts.poppins(
    textStyle: TextStyle(
        fontWeight: FontWeightHelper.medium,
        fontSize: 12.sp,
        color: appColors.KPprimary
    ),
  );
  static TextStyle font12grayRegular = GoogleFonts.poppins(
    textStyle: TextStyle(
        fontWeight: FontWeightHelper.regular,
        fontSize: 12.sp,
        color: appColors.KPgray
    ),
  );
}

