import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/styles.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/widget/custom_app_bar.dart';
import '../../../../core/widget/main_text_field.dart';
import '../../domain/entities/category_response_entity.dart';
import '../widgets/custom_category_scrollable_widget.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});


  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;

    final products = arguments is List<CategoryListEntity>
        ? arguments
        : <CategoryListEntity>[];

    return SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(pageName: "Categories",),
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
                      itemCount: products.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20.0,
                        crossAxisSpacing: 9.0,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (context,index) => CustomCategoryScrollableWidget(categoryListEntity: products[index],)
                  ),
                )
              ],
            ),
          ),

        )
    );
  }
}
