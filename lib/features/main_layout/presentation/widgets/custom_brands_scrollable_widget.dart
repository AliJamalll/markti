import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markti/core/constants/styles.dart';
import 'package:markti/core/resources/color_manager.dart';
import 'package:markti/features/main_layout/domain/entities/brand_response_entity.dart';
import 'package:markti/features/main_layout/domain/repositories/repository/main_layout_repository.dart';

import '../../../../core/constants/colors.dart';
import '../../domain/entities/main_layout_response_entity.dart';

class customBrandsScrollableWidget extends StatefulWidget {
  customBrandsScrollableWidget({super.key,required this.brandListResponseEntity});

  final BrandListResponseEntity brandListResponseEntity;

  @override
  State<customBrandsScrollableWidget> createState() => _CustomProductsScrollableWidgetState();
}

class _CustomProductsScrollableWidgetState extends State<customBrandsScrollableWidget> {
  String? brandName;
  String? image = null;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 160.w,
          height: 170.h,
          decoration: BoxDecoration(
            color: appColors.KPlightBlue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 105.h,),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: Text(
              //           "${widget.brandListResponseEntity.n} '1000' LE",
              //           overflow: TextOverflow.ellipsis,
              //           maxLines: 1,
              //           style: TextStyle(fontSize: 12),
              //         ),
              //       ),
              //       Icon(Icons.star, color: appColors.KPnavy, size: 20),
              //       SizedBox(width: 4),
              //       Text(
              //         "22",
              //         style: TextStyle(color: appColors.KPnavy, fontSize: 12),
              //         overflow: TextOverflow.ellipsis,
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(height: 5.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: Text(
                    "${widget.brandListResponseEntity.name}",
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
                  widget.brandListResponseEntity.imagePath?.startsWith('http') == true
                      ? widget.brandListResponseEntity.imagePath!
                      : 'https://yourdomain.com/default-image.jpg',
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.broken_image);
                  },
                )

              ),
            )
        ),
      ],
    );
  }
}