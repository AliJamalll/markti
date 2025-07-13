import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markti/core/constants/colors.dart';
import 'package:markti/core/constants/styles.dart';

import '../../../../core/widget/custom_app_bar.dart';
import '../../../../core/widget/custom_elevated_button.dart';
import '../../../../core/widget/main_text_field.dart';
import '../widgets/map_widget.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({super.key});

  Widget dashedDivider({
    double dashWidth = 8,
    double dashHeight = 1,
    Color color = Colors.grey,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(pageName: "Checkout"),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 10.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Address",style: textStyles.font20navySemiBold,),
                Container(
                  width: double.infinity,
                  height: 220.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: appColors.KPnavy,width: 1)
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 120.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(14),topRight: Radius.circular(14)),
                            border: Border.all(color: appColors.KPnavy,width: 1)
            
                        ),
                        ///TODO: add map here
                        child: LocationPickerScreen(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Row(
                          children: [
                              Icon(Icons.location_on),
                              SizedBox(width: 3.w,),
                            Text("Home",style: textStyles.font14navyMedium,),
                            Spacer(),
                            TextButton(onPressed: (){},
                                child: Text("Change",style: textStyles.font16blueSemiBold,)
                            )
                          ],
                        ),
                      ),
                      Column(
                        spacing: 5.h,
                        children: [
                          Text("Anshas, Al-sharqia, Egypt.",style: textStyles.font14navyMedium,),
                          Text("Mobile: +20 101 840 3043",style: textStyles.font14navyMedium,),
                        ],
                      )
                    ],
                  ),
                ),
                Text("Delivery time",style: textStyles.font20navySemiBold,),
                Container(
                  height: 50.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: appColors.KPnavy,width: 1)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.delivery_dining,color: Colors.blue,),
                      SizedBox(width: 10.w,),
                      Text("Within 2 days",style: textStyles.font14navyMedium,)
                    ],
                  ),
                ),
                Text("Payment",style: textStyles.font20navySemiBold,),
                Container(
                  height: 50.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: appColors.KPnavy,width: 1)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.monetization_on_sharp,color: Colors.blue,),
                        SizedBox(width: 5.w,),
                        Text("Cash on delivery",style: textStyles.font14navyMedium,),
                        Spacer(),
                        TextButton(onPressed: (){},
                            child: Text("Change",style: textStyles.font16blueSemiBold,)
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: BuildTextField(
                        hint: "Voucher code",
                        labelTextStyle: textStyles.font12grayRegular,
                        backgroundColor: appColors.KPwhite,
                        borderBackgroundColor: appColors.KPnavy,
                        textInputType: TextInputType.text,
                      ),
            
                    ),
                      SizedBox(width: 10.w,),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 50.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(color: appColors.KPnavy,width: 1)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Apply",style: textStyles.font16blueSemiBold,),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
                Text("Payment",style: textStyles.font20navySemiBold,),
                Container(
                  width: double.infinity,
                  height: 90.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: appColors.KPnavy,width: 1)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Suptotal (3 items)", style: textStyles.font14navyMedium,),
                            Spacer(),
                            Text("EGP 1,120,00", style: textStyles.font14navyMedium,),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Delivery Fees", style: textStyles.font14navyMedium,),
                            Spacer(),
                            Text("EGP 10,00", style: textStyles.font14navyMedium,),
                          ],
                        ),
                        Spacer(),
                        dashedDivider(),
                        Row(
                          children: [
                            Text("Total", style: textStyles.font14navyMedium,),
                            Spacer(),
                            Text("EGP 1,130,00", style: textStyles.font14navyMedium,),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5.h,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomElevatedButton(
                    onTap: () {
                    },
                    label: 'Place Order',
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
