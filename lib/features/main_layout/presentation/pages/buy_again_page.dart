import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/styles.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/widget/custom_app_bar.dart';
import '../../../../core/widget/main_text_field.dart';
import '../widgets/custom_buy_again_scrollable_widget.dart';
import '../widgets/custom_products_scrollable_widget.dart';

class BuyAgainPage extends StatelessWidget {
  const BuyAgainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(pageName: "Buy Again",),
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
              Text("All Products",style: textStyles.font20navySemiBold,),
              Expanded(
                child: GridView.builder(
                    itemCount: 8,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20.0,
                      crossAxisSpacing: 9.0,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (context,index) => customBuyAgainScrollableWidget()
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
