import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:markti/core/constants/colors.dart';
import 'package:markti/core/constants/styles.dart';
import 'package:markti/core/resources/assets_manager.dart';

import '../../../../core/cache/secure_storage.dart';
import '../../../../core/routes_manager/routes.dart';
import '../../../../core/widget/custom_app_bar.dart';
import '../widgets/custom_profile_features.dart';
import '../widgets/my_profile_photo_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(pageName: "Profile"),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.h),
                MyProfilePhotoScreen(),
                SizedBox(height: 40.h),
                CustomProfileFeatures(
                  firstIcon: Icon(Icons.person,size: 20,),
                  text: Text("Account Preferences",style: textStyles.font14navyMedium,),
                  lastIcon: Icon(Icons.arrow_forward_ios_outlined,size: 20,),
                  onPressed: () {

                  },
                ),
                Divider(color: appColors.KPnavy,height: 1,),
                CustomProfileFeatures(
                  firstIcon: Icon(Icons.payment,size: 20,),
                  text: Text("Subscription & Payment",style: textStyles.font14navyMedium,),
                  lastIcon: Icon(Icons.arrow_forward_ios_outlined,size: 20,),
                  onPressed: () {

                  },
                ),
                Divider(color: appColors.KPnavy,height: 1,),
                CustomProfileFeatures(
                  firstIcon: Icon(Icons.notifications,size: 20,),
                  text: Text("App Notifications",style: textStyles.font14navyMedium,),
                  lastIcon: Icon(Icons.arrow_forward_ios_outlined,size: 20,),
                  onPressed: () {

                  },
                ),
                Divider(color: appColors.KPnavy,height: 1,),
                CustomProfileFeatures(
                  firstIcon: Icon(Icons.dark_mode,size: 20,),
                  text: Text("Dark Mode",style: textStyles.font14navyMedium,),
                  lastIcon: isDarkMode ? Icon(Icons.dark_mode,size: 20,) : Icon(Icons.light_mode,size: 20,),
                  onPressed: () {
                    setState(() {
                      isDarkMode = !isDarkMode;
                    });
                  },
                ),
                Divider(color: appColors.KPnavy,height: 1,),
                CustomProfileFeatures(
                  firstIcon: Icon(Icons.star,size: 20,),
                  text: Text("Rate Us",style: textStyles.font14navyMedium,),
                  lastIcon: Icon(Icons.arrow_forward_ios_outlined,size: 20,),
                  onPressed: () {

                  },
                ),
                Divider(color: appColors.KPnavy,height: 1,),
            CustomProfileFeatures(
              firstIcon: Icon(Icons.feedback,size: 20,),
              text: Text("Provide Feedback",style: textStyles.font14navyMedium,),
              lastIcon: Icon(Icons.arrow_forward_ios_outlined,size: 20,),
              onPressed: () {

              },
            ),
                Divider(color: appColors.KPnavy,height: 1,),
                SizedBox(height: 10.h,),
                ElevatedButton(
                  onPressed: () async{
                    await secureStorage.delete(key: "token");
                    Navigator.pushNamed(context, Routes.signIn);
                  },
                  child: const Text('logout'),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
