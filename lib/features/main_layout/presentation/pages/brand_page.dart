import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markti/features/main_layout/domain/entities/brand_response_entity.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/styles.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/widget/custom_app_bar.dart';
import '../../../../core/widget/main_text_field.dart';
import '../widgets/custom_brands_scrollable_widget.dart';
import '../widgets/custom_category_scrollable_widget.dart';

class BrandPage extends StatelessWidget {
   BrandPage({super.key});



  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;

    // Add debug prints to see what we're receiving
    // print("Arguments received: $arguments");
    // print("Arguments type: ${arguments.runtimeType}");

    final brands = arguments is List<BrandListResponseEntity>
        ? arguments
        : <BrandListResponseEntity>[];
    return SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(pageName: "Brands",),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25.h,),
                BuildTextField(
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.filter_alt),
                  hint: "What are you looking for ?",
                  labelTextStyle: textStyles.font12grayRegular,
                  backgroundColor: appColors.KPwhite,
                  borderBackgroundColor: appColors.KPnavy,
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 10.h,),
                Text("All Brands",style: textStyles.font20navySemiBold,),
                SizedBox(height: 10.h,),
                Expanded(
                  child: GridView.builder(
                      itemCount: brands.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20.0,
                        crossAxisSpacing: 9.0,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (context,index) => customBrandsScrollableWidget(brandListResponseEntity: brands[index],)
                  ),
                )
              ],
            ),
          ),

        )
    );
  }
}
