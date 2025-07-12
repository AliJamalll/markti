import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markti/core/constants/styles.dart';
import 'package:markti/core/resources/color_manager.dart';

import '../../../../core/constants/colors.dart';

class CustomProductsScrollableWidget extends StatefulWidget {
  CustomProductsScrollableWidget({super.key,});

  @override
  State<CustomProductsScrollableWidget> createState() => _CustomProductsScrollableWidgetState();
}

class _CustomProductsScrollableWidgetState extends State<CustomProductsScrollableWidget> {
  bool isFavorite = false;
  String? price;
  String? rating;
  String? brandName;
  String? image = null;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 170.w,
          height: 170.h,
          decoration: BoxDecoration(
            color: appColors.KPlightBlue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 105.h,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "${price ?? ''} LE",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Icon(Icons.star, color: appColors.KPnavy, size: 20),
                    SizedBox(width: 4),
                    Text(
                      "$rating",
                      style: TextStyle(color: appColors.KPnavy, fontSize: 12),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: Text(
                    "$brandName",
                    style: textStyles.font12grayRegular,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
            top: 10.h,
            left: 10.w,
            right: 10.w,
            child: Container(
              height: 96.h,
              width: 152.w,
              decoration: BoxDecoration(
                color: appColors.KPnavy,
                borderRadius: BorderRadius.circular(5),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  image ?? '',
                  fit: BoxFit.cover,
                  width: 152.w,
                  height: 96.h,
                  errorBuilder: (context, error, stackTrace) =>
                      Center(child: Icon(Icons.broken_image)),
                ),
              ),
            )
        ),
        Positioned(
            top: 20.h,
            right: 20.w,
            child: Container(
              width: 30.w,
              height: 30.h,
              decoration: BoxDecoration(
                  color: appColors.KPwhite,
                  borderRadius: BorderRadius.circular(13)
              ),
              child: IconButton(onPressed: (){
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
                  icon: isFavorite ? Icon(Icons.favorite, color: Colors.red, size: 20,) :
                  Icon(Icons.favorite_border, color: appColors.KPnavy, size: 20,)
              ),
            )
        )
      ],
    );
  }
}