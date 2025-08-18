import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:markti/core/constants/colors.dart';

import '../../../../core/cache/secure_storage.dart';
import '../../domain/entities/category_response_entity.dart';

class CustomCategoryScrollableWidget extends StatefulWidget {
  const CustomCategoryScrollableWidget({super.key, required this.categoryListEntity});

  final CategoryListEntity categoryListEntity;

  @override
  State<CustomCategoryScrollableWidget> createState() => _CustomCategoryScrollableWidgetState();
}

class _CustomCategoryScrollableWidgetState extends State<CustomCategoryScrollableWidget> {
  final storage = const FlutterSecureStorage();
  String? token;

  @override
  void initState() {
    super.initState();
    _loadToken();
  }

  Future<void> _loadToken() async {
    final loadedToken = await storage.read(key: "token");
    if (mounted) {
      setState(() {
        token = loadedToken;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 100.w,
          height: 90.h,
          decoration: BoxDecoration(
            color: appColors.KPlightBlue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: token != null && widget.categoryListEntity.imagePath != null && widget.categoryListEntity.imagePath!.isNotEmpty
                ? Image.network(
              widget.categoryListEntity.imagePath![0],
              headers: {
                "Authorization": "Bearer $token"
              },
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                print('📸 Loading image: ${widget.categoryListEntity.name}');
                return const Center(child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) {
                print('❌ Image error for ${widget.categoryListEntity.name}: $error');
                print('🔗 Image URL: ${widget.categoryListEntity.imagePath![0]}');
                return const Center(child: Icon(Icons.broken_image));
              },
            )
                : const Center(child: CircularProgressIndicator()),
          ),
        ),
        SizedBox(height: 8.h),
        SizedBox(
          width: 100.w,
          child: Text(
            widget.categoryListEntity.name ?? "Category",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}