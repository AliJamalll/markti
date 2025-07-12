import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markti/core/constants/colors.dart';

class CustomCategoryScrollableWidget extends StatelessWidget {
  CustomCategoryScrollableWidget({super.key});

  String? image;
  String? productName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h, // ارتفاع كلي للكومبوننت
      child: GridView.builder(
        itemCount: 8,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 50.0,
          crossAxisSpacing: 1.0,
          childAspectRatio: 1.5,
        ),
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 100.w,
                height: 90.h, // قللت الحجم
                decoration: BoxDecoration(
                  color: appColors.KPlightBlue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    image ?? '',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    errorBuilder: (context, error, stackTrace) =>
                    const Center(child: Icon(Icons.broken_image)),
                  ),
                ),
              ),
              SizedBox(height: 8.h), // قللت المسافة
              SizedBox(
                width: 100.w,
                child: Text(
                  productName ?? "Category",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
