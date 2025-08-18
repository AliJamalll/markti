import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markti/core/resources/assets_manager.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/styles.dart';
import '../../../../core/widget/custom_app_bar.dart';
import '../../../../core/widget/main_text_field.dart';
import '../../domain/entities/main_layout_response_entity.dart';
import '../widgets/custom_products_scrollable_widget.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    // Debug: Let's see what's being passed
    final arguments = ModalRoute.of(context)?.settings.arguments;

    // Add debug prints to see what we're receiving
    // print("Arguments received: $arguments");
    // print("Arguments type: ${arguments.runtimeType}");

    final products = arguments is List<ListMainLayoutResponseEntity>
        ? arguments
        : <ListMainLayoutResponseEntity>[];

    //print("Products length: ${products.length}");

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(pageName: "Popular Products"),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25.h),
              BuildTextField(
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.filter_alt),
                hint: "What are you looking for ?",
                labelTextStyle: textStyles.font12grayRegular,
                backgroundColor: appColors.KPwhite,
                borderBackgroundColor: appColors.KPnavy,
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 10.h),
              Text("All Products", style: textStyles.font20navySemiBold),
              // Handle empty products list
              if (products.isEmpty)
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_bag_outlined,
                            size: 64,
                            color: appColors.KPnavy.withOpacity(0.5)),
                        SizedBox(height: 16.h),
                        Text(
                          "No products available",
                          style: textStyles.font14navyMedium,
                        ),
                      ],
                    ),
                  ),
                )
              else
                Expanded(
                  child: GridView.builder(
                    itemCount: products.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15.0,
                      crossAxisSpacing: 30.0,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (context, index) => CustomProductsScrollableWidget(

                      listMainLayoutResponseEntity: products[index],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}