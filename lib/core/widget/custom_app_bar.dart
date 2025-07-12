import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import '../resources/assets_manager.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
   CustomAppBar({super.key,required this.pageName});

  String ? pageName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.only(left: 12.w), // ← المسافة اللي عايزها من الشمال
          child: Container(
            height: 30.h,
            width: 30.w,
            decoration: BoxDecoration(
                border:  Border.all(color: appColors.KPnavy, width: 1),
                borderRadius: BorderRadius.circular(50.r)
            ),
            child: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios_new)
            ),
          ),
        ),
        title: Text(pageName ?? ""),
        actions: [
          CircleAvatar(
            radius: 40.r,
            backgroundImage: AssetImage(ImageAssets.ali),
          )
        ],
      ),
    );
  }
   @override
   Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
