import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:markti/core/constants/colors.dart';
import 'package:markti/core/constants/styles.dart';

import '../../../../core/widget/custom_app_bar.dart';
import '../../../../core/widget/custom_elevated_button.dart';
import '../../../../core/widget/main_text_field.dart';
import '../widgets/map_widget.dart'; // فيها LocationPickerScreen

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {

  LatLng? selectedLocation;
  String? selectedAddress;


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

  void _openMapScreen() async {
    final LatLng? location = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LocationPickerScreen()),
    );

    if (location != null) {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        location.latitude,
        location.longitude,
      );

      Placemark place = placemarks.first;
      String address =
          "${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}";

      setState(() {
        selectedLocation = location;
        selectedAddress = address;
      });
    }
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
              children: [
                Text("Address", style: textStyles.font20navySemiBold),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: appColors.KPnavy, width: 1),
                  ),
                  child: Column(
                    children: [
                      ElevatedButton.icon(
                        onPressed: _openMapScreen,
                        icon: Icon(Icons.map),
                        label: Text("Pick Location from Map"),
                      ),
                      SizedBox(height: 10),
                      selectedLocation == null
                          ? Text("No location selected")
                          : Text(
                        selectedAddress ?? "Loading address...",
                        style: textStyles.font14navyMedium,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Text("Delivery time", style: textStyles.font20navySemiBold),
                Container(
                  height: 50.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: appColors.KPnavy, width: 1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.delivery_dining, color: Colors.blue),
                      SizedBox(width: 10.w),
                      Text("Within 2 days", style: textStyles.font14navyMedium)
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Text("Payment", style: textStyles.font20navySemiBold),
                Container(
                  height: 50.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: appColors.KPnavy, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.monetization_on_sharp, color: Colors.blue),
                        SizedBox(width: 5.w),
                        Text("Cash on delivery",
                            style: textStyles.font14navyMedium),
                        Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: Text("Change",
                              style: textStyles.font16blueSemiBold),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
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
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                              color: appColors.KPnavy, width: 1),
                        ),
                        child: Center(
                          child: Text("Apply",
                              style: textStyles.font16blueSemiBold),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Text("Payment Summary", style: textStyles.font20navySemiBold),
                Container(
                  padding: EdgeInsets.all(8),
                  width: double.infinity,
                  height: 100.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: appColors.KPnavy, width: 1)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Subtotal (3 items)",
                              style: textStyles.font14navyMedium),
                          Spacer(),
                          Text("EGP 1,120.00",
                              style: textStyles.font14navyMedium),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Delivery Fees",
                              style: textStyles.font14navyMedium),
                          Spacer(),
                          Text("EGP 10.00",
                              style: textStyles.font14navyMedium),
                        ],
                      ),
                      dashedDivider(),
                      Row(
                        children: [
                          Text("Total", style: textStyles.font14navyMedium),
                          Spacer(),
                          Text("EGP 1,130.00",
                              style: textStyles.font14navyMedium),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                CustomElevatedButton(
                  onTap: () {},
                  label: 'Place Order',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
