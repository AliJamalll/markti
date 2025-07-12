import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markti/core/resources/assets_manager.dart';
import 'package:markti/core/routes_manager/routes.dart';

import '../../../../core/cache/secure_storage.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/styles.dart';
import '../../../../core/widget/main_text_field.dart';
import '../../../../core/widget/validators.dart';
import '../widgets/custom_category_scrollable_widget.dart';
import '../widgets/custom_products_scrollable_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                        backgroundImage: AssetImage(ImageAssets.ali)
                    ),
                    SizedBox(width: 20.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Hi ali!",style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(onPressed: (){}, icon: Icon(Icons.notifications,color: Colors.blue,size: 30,))
                  ],
                ),
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
                SizedBox(
                    height: 130.h,
                    width: 400.w,
                    child: Image.asset(ImageAssets.scrolled_pic)),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    Text("Popular Product",style: textStyles.font20navySemiBold,),
                    Spacer(),
                    TextButton(onPressed: (){
                      Navigator.pushNamed(context, Routes.popular_products);
                    },
                        child: Text("View All",style: textStyles.font16blueSemiBold,),
                    )
                  ],
                ),
                SizedBox(height: 5.h,),
                SizedBox(
                  height: 170.h,
                    child:
                ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index) => CustomProductsScrollableWidget(),
                    separatorBuilder: (context,index) => SizedBox(width: 18.w,),
                    itemCount: 5
                )
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    Text("Category",style: textStyles.font20navySemiBold,),
                    Spacer(),
                    TextButton(onPressed: (){},
                      child: Text("View All",style: textStyles.font16blueSemiBold,),
                    )
                  ],
                ),
                SizedBox(
                    height: 270.h,
                    child: CustomCategoryScrollableWidget()),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    Text("Brands",style: textStyles.font20navySemiBold,),
                    Spacer(),
                    TextButton(onPressed: (){},
                      child: Text("View All",style: textStyles.font16blueSemiBold,),
                    )
                  ],
                ),
                SizedBox(
                    height: 170.h,
                    child:
                    ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index) => CustomProductsScrollableWidget(),
                        separatorBuilder: (context,index) => SizedBox(width: 18.w,),
                        itemCount: 5
                    )
                ),
                Row(
                  children: [
                    Text("Buy Again",style: textStyles.font20navySemiBold,),
                    Spacer(),
                    TextButton(onPressed: (){},
                      child: Text("View All",style: textStyles.font16blueSemiBold,),
                    )
                  ],
                ),
                SizedBox(
                    height: 170.h,
                    child:
                    ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index) => CustomProductsScrollableWidget(),
                        separatorBuilder: (context,index) => SizedBox(width: 18.w,),
                        itemCount: 5
                    )
                ),
                ElevatedButton(
                  onPressed: () async{
                    await secureStorage.delete(key: "token");
                    Navigator.pushNamed(context, Routes.signIn);
                  },
                  child: const Text('logout'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
