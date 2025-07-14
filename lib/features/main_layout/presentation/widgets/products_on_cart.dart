import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markti/core/constants/styles.dart';

import '../../../../core/constants/colors.dart';

class ProductsOnCart extends StatefulWidget {
  ProductsOnCart({super.key});

  @override
  State<ProductsOnCart> createState() => _ProductsOnCartState();
}

class _ProductsOnCartState extends State<ProductsOnCart> {
  String? image;

  String? name;

  String? price;

  int? quantity;

  String? description;

  bool isFavorite = false;

  String? rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: appColors.KPprimary,width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0,bottom: 10),
        child: Row(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.5),
                  width: 1,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  image ?? '',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  errorBuilder:
                      (context, error, stackTrace) =>
                          const Center(child: Icon(Icons.broken_image)),
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding:  EdgeInsets.only(left: 10.0, right: 10),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Text(name ??"product name",style: textStyles.font14navyMedium,),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isFavorite = !isFavorite;
                              });
                            },
                            icon:
                                isFavorite
                                    ? Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: 30,
                                    )
                                    : Icon(
                                      Icons.favorite_border,
                                      color: appColors.KPnavy,
                                      size: 30,
                                    ),
                          ),
                          SizedBox(height: 3),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Text(description ?? "No description available"),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          SizedBox(height: 3),
                          Text(
                            "price: ${price ?? "0.00"} EGP",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text(
                            rating ?? "0.0",
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Icon(Icons.star, color: Colors.amberAccent),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Row(
                          children: [
                            Flexible(
                              child: Container(
                                width: 50.w,
                                height: 60.h,
                                decoration: BoxDecoration(
                                  color: appColors.KPprimary.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: appColors.KPprimary,width: 1.5)
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      quantity = (quantity ?? 1) - 1;
                                    });
                                    if(quantity == 0){

                                    }
                                  },
                                  icon: quantity == 1 ? Icon(Icons.delete,color: Colors.red,):Icon(Icons.remove),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Flexible(
                              child: Container(
                                  width: 120.w,
                                  height: 80.h,
                                  decoration: BoxDecoration(
                                      color: appColors.KPprimary.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: appColors.KPprimary,width: 1.5)
                                  ),
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text("${quantity ?? 1}"))),
                            ),
                            SizedBox(width: 10),
                            Flexible(
                              child: Container(
                                width: 50.w,
                                height: 60.h,
                                decoration: BoxDecoration(
                                    color: appColors.KPprimary.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: appColors.KPprimary,width: 1.5)
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      quantity = (quantity ?? 1) + 1;
                                    });
                                  },
                                  icon: Icon(Icons.add),
                                ),
                              ),
                            ),
                          ],
                        )
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
