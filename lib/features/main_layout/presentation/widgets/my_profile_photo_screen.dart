import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/resources/assets_manager.dart';

class MyProfilePhotoScreen extends StatefulWidget {
  const MyProfilePhotoScreen({super.key});

  @override
  State<MyProfilePhotoScreen> createState() => _MyProfilePhotoScreenState();
}

class _MyProfilePhotoScreenState extends State<MyProfilePhotoScreen> {
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;

  Future<void> _pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(child: Image.asset(ImageAssets.shapes)),
        Positioned(
          left: 50,
          right: 50,
          top: 55,
          child: CircleAvatar(
            radius: 55.r,
            backgroundImage:
            _imageFile != null
                ? FileImage(_imageFile!) as ImageProvider
                : AssetImage(ImageAssets.ali),
          ),
        ),
        Positioned(
          top: 50,
          left: MediaQuery.of(context).size.width / 2 - 85,
          child: Container(
            height: 120.h,
            width: 120.w,
            decoration: BoxDecoration(
              border: Border.all(
                color: appColors.KPprimary,
                width: 2.w,
              ),
              borderRadius: BorderRadius.circular(100.r),
            ),
          ),
        ),
        Positioned(
          top: 140,
          right: 125,
          child: Container(
            width: 40.w,
            height: 35.w,
            decoration: BoxDecoration(
              color: appColors.KPwhite,
              borderRadius: BorderRadius.circular(100.r),
              border: Border.all(
                color: appColors.KPprimary,
                width: 2.w,
              ),
            ),
            child: IconButton(
              onPressed: () async {
                await _pickImageFromGallery(); // تستدعي الفنكشن وتستنى النتيجة
              },
              icon: Icon(Icons.camera_alt, size: 20, color: appColors.KPprimary),
            ),

          ),
        ),
      ],
    );
  }
}
