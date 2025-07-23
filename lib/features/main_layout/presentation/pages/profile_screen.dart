import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:markti/core/constants/colors.dart';
import 'package:markti/core/constants/styles.dart';
import 'package:markti/core/di/di.dart';
import 'package:markti/core/resources/assets_manager.dart';
import 'package:markti/features/main_layout/presentation/manager/main_layout_cubit.dart';

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

  MainLayoutCubit mainLayoutCubit = getIt<MainLayoutCubit>();

  void openAppStorePage() async {
    final InAppReview inAppReview = InAppReview.instance;

    try {
      await inAppReview.openStoreListing(
        appStoreId: Platform.isIOS ? '1234567890' : null,
        // For iOS (e.g. "1234567890")
        microsoftStoreId: null, // Ignore unless targeting Windows
      );
    } catch (e) {
      print('Error opening store listing: $e');
    }
  }

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
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
                  firstIcon: Icon(Icons.person, size: 20),
                  text: Text(
                    "Account Preferences",
                    style: textStyles.font14navyMedium,
                  ),
                  lastIcon: Icon(Icons.arrow_forward_ios_outlined, size: 20),
                  onPressed: () {},
                ),
                Divider(color: appColors.KPnavy, height: 1),
                CustomProfileFeatures(
                  firstIcon: Icon(Icons.payment, size: 20),
                  text: Text(
                    "Subscription & Payment",
                    style: textStyles.font14navyMedium,
                  ),
                  lastIcon: Icon(Icons.arrow_forward_ios_outlined, size: 20),
                  onPressed: () {},
                ),
                Divider(color: appColors.KPnavy, height: 1),
                CustomProfileFeatures(
                  firstIcon: Icon(Icons.notifications, size: 20),
                  text: Text(
                    "App Notifications",
                    style: textStyles.font14navyMedium,
                  ),
                  onPressed: () {},
                  isSwitched: isSwitched,
                  onToggle: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                ),
                Divider(color: appColors.KPnavy, height: 1),
                BlocBuilder<MainLayoutCubit, MainLayoutState>(
                  builder: (context, state) {
                    final isDarkMode = state is toggleToDark;

                    return CustomProfileFeatures(
                      firstIcon: Icon(Icons.dark_mode, size: 20),
                      text: Text(
                        "Dark Mode",
                        style: textStyles.font14navyMedium,
                      ),
                      lastIcon: Icon(
                        isDarkMode ? Icons.dark_mode : Icons.light_mode,
                        size: 20,
                        color: isDarkMode ? appColors.KPnavy : appColors.KPnavy,
                      ),
                      onPressed: () {
                        context.read<MainLayoutCubit>().ToggleTheme(
                          !isDarkMode,
                        );
                      },
                    );
                  },
                ),
                Divider(color: appColors.KPnavy, height: 1),
                CustomProfileFeatures(
                  firstIcon: Icon(Icons.star, size: 20),
                  text: Text("Rate Us", style: textStyles.font14navyMedium),
                  lastIcon: Icon(Icons.arrow_forward_ios_outlined, size: 20),
                  onPressed: openAppStorePage,
                ),
                Divider(color: appColors.KPnavy, height: 1),
                CustomProfileFeatures(
                  firstIcon: Icon(Icons.feedback, size: 20),
                  text: Text(
                    "Provide Feedback",
                    style: textStyles.font14navyMedium,
                  ),
                  lastIcon: Icon(Icons.arrow_forward_ios_outlined, size: 20),
                  onPressed: () {},
                ),
                Divider(color: appColors.KPnavy, height: 1),
                CustomProfileFeatures(
                  firstIcon: Icon(Icons.logout, size: 20, color: Colors.red),
                  text: Text("Logout", style: textStyles.font14navyMedium),
                  lastIcon: Icon(Icons.arrow_forward_ios_outlined, size: 20),
                  onPressed: () async {
                    await secureStorage.delete(key: "token");
                    Navigator.pushNamed(context, Routes.signIn);
                  },
                ),

                // ElevatedButton(
                //   onPressed: () async{
                //     await secureStorage.delete(key: "token");
                //     Navigator.pushNamed(context, Routes.signIn);
                //   },
                //   child: const Text('logout'),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
