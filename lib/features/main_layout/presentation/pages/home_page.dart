import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markti/core/di/di.dart';
import 'package:markti/core/resources/assets_manager.dart';
import 'package:markti/core/routes_manager/routes.dart';
import 'package:markti/features/main_layout/presentation/manager/main_layout_cubit.dart';

import '../../../../core/cache/secure_storage.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/styles.dart';
import '../../../../core/widget/main_text_field.dart';
import '../../../../core/widget/validators.dart';
import '../widgets/custom_brands_scrollable_widget.dart';
import '../widgets/custom_buy_again_scrollable_widget.dart';
import '../widgets/custom_category_scrollable_widget.dart';
import '../widgets/custom_products_scrollable_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MainLayoutCubit mainLayoutCubit = getIt<MainLayoutCubit>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mainLayoutCubit.getALlProducts();
    mainLayoutCubit.getAllCategories();
    mainLayoutCubit.getAllBrands();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<MainLayoutCubit, MainLayoutState>(
          bloc: mainLayoutCubit,
          builder: (context, state) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildHeader(),
                    SizedBox(height: 25.h),
                    _buildSearchBar(),
                    SizedBox(height: 10.h),
                    SizedBox(
                      height: 130.h,
                      width: 400.w,
                      child: Image.asset(ImageAssets.scrolled_pic),
                    ),
                    SizedBox(height: 5.h),

                    _buildPopularProductsSection(state),
                    SizedBox(height: 5.h),
                    _buildCategoriesSection(state),
                    SizedBox(height: 5.h),
                    _buildBrandsSection(state),
                    // SizedBox(height: 5.h),
                    // _buildBuyAgainSection(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  ///-------------- الأقسام ----------------///

  Widget _buildHeader() {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(ImageAssets.ali),
        ),
        SizedBox(width: 20.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Hi ali!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications, color: Colors.blue, size: 30),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return BuildTextField(
      prefixIcon: Icon(Icons.search),
      suffixIcon: Icon(Icons.filter_alt),
      hint: "What are you looking for ?",
      labelTextStyle: textStyles.font12grayRegular,
      backgroundColor: appColors.KPwhite,
      borderBackgroundColor: appColors.KPnavy,
      textInputType: TextInputType.text,
    );
  }

  Widget _buildPopularProductsSection(MainLayoutState state) {
    final isLoading = state is getProductsLoading;
    final hasProducts = mainLayoutCubit.productsList.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text("Popular Product", style: textStyles.font20navySemiBold),
            Spacer(),
            TextButton(
              onPressed: hasProducts
                  ? () {
                Navigator.pushNamed(
                  context,
                  Routes.popular_products,
                  arguments: mainLayoutCubit.productsList,
                );
              }
                  : null,
              child: Text(
                isLoading ? "Loading..." : "View All",
                style: hasProducts
                    ? textStyles.font16blueSemiBold
                    : textStyles.font16blueSemiBold.copyWith(color: Colors.grey),
              ),
            ),
          ],
        ),
        SizedBox(height: 5.h),
        if (isLoading)
          SizedBox(height: 170.h, child: Center(child: CircularProgressIndicator()))
        else if (mainLayoutCubit.productsList.isEmpty)
          SizedBox(
            height: 170.h,
            child: Center(child: CircularProgressIndicator(color: appColors.KPprimary,)),
          )
        else
          SizedBox(
            height: 170.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: mainLayoutCubit.productsList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CustomProductsScrollableWidget(

                    listMainLayoutResponseEntity:
                    mainLayoutCubit.productsList[index],
                  ),
                );
              },
            ),
          ),
      ],
    );
  }

  Widget _buildCategoriesSection(MainLayoutState state) {
    if (state is getCategoryLoading) {
      return Center(child: CircularProgressIndicator());
    } else if (state is getCategoryError) {
      return Center(child: Text(state.errorMessage));
    } else if (state is getCategorySuccess) {
      final categories = state.categoryResponseEntity.list;
      if (categories == null || categories.isEmpty) {
        return Center(child: Text("No categories found."));
      }
      return Column(
        children: [
          Row(
            children: [
              Text("Category", style: textStyles.font20navySemiBold),
              Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.categories,
                      arguments: mainLayoutCubit.categoriesList);
                },
                child: Text("View All", style: textStyles.font16blueSemiBold),
              ),
            ],
          ),
          SizedBox(
            height: 270.h,
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return CustomCategoryScrollableWidget(
                  categoryListEntity: categories[index],
                );
              },
            ),
          ),
        ],
      );
    }
    return SizedBox();
  }

  Widget _buildBrandsSection(MainLayoutState state) {
    if (state is getBrandsLoading) {
      return Center(child: CircularProgressIndicator());
    } else if (state is getBrandsError) {
      return Center(child: Text(state.errorMessage));
    } else if (state is getBrandsSuccess) {
      final brands = state.brandResponseEntity.list;
      if (brands == null || brands.isEmpty) {
        return Center(child: Text("No brands found."));
      }
      return Column(
        children: [
          Row(
            children: [
              Text("Brands", style: textStyles.font20navySemiBold),
              Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.brands,
                      arguments: mainLayoutCubit.brandsList);
                },
                child: Text("View All", style: textStyles.font16blueSemiBold),
              ),
            ],
          ),
          SizedBox(
            height: 170.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: brands.length,
              itemBuilder: (context, index) {
                return customBrandsScrollableWidget(
                  brandListResponseEntity: mainLayoutCubit.brandsList[index],
                );
              },
              separatorBuilder: (_, __) => SizedBox(width: 18.w),
            ),
          ),
        ],
      );
    }
    return SizedBox();
  }

  // Widget _buildBuyAgainSection() {
  //   return Column(
  //     children: [
  //       Row(
  //         children: [
  //           Text("Buy Again", style: textStyles.font20navySemiBold),
  //           Spacer(),
  //           TextButton(
  //             onPressed: () {
  //               Navigator.pushNamed(context, Routes.buyAgain);
  //             },
  //             child: Text("View All", style: textStyles.font16blueSemiBold),
  //           ),
  //         ],
  //       ),
  //       SizedBox(
  //         height: 170.h,
  //         child: ListView.separated(
  //           scrollDirection: Axis.horizontal,
  //           itemCount: 5,
  //           itemBuilder: (_, index) => customBuyAgainScrollableWidget(),
  //           separatorBuilder: (_, __) => SizedBox(width: 18.w),
  //         ),
  //       ),
  //     ],
  //   );
  // }

}
