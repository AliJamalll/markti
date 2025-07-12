import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markti/core/constants/styles.dart';
import 'package:markti/core/routes_manager/routes.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/widget/custom_app_bar.dart';
import '../../../../core/widget/custom_elevated_button.dart';
import '../widgets/products_on_cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(pageName: "Cart"),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Products on Cart", style: textStyles.font20navySemiBold),
                SizedBox(height: 10.h),
                SizedBox(
                  height: 450.h,
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ProductsOnCart(),
                    separatorBuilder:
                        (context, index) => SizedBox(height: 15.h),
                    itemCount: 8,
                  ),
                ),
                Container(
                  height: 120.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: appColors.KPlightBlue,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: appColors.KPprimary, width: 2),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Suptotal (3 items)",
                              style: textStyles.font14navyMedium,
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "EGP 1,120,00",
                              style: textStyles.font14navyMedium,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: CustomElevatedButton(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.checkOut);
                          },
                          label: 'Check Out',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
