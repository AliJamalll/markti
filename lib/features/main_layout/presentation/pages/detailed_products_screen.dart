import 'package:flutter/material.dart';
import 'package:markti/core/widget/custom_app_bar.dart';

import '../../domain/entities/main_layout_response_entity.dart';

class DetailedProductsScreen extends StatelessWidget {
  final ListMainLayoutResponseEntity product;

  const DetailedProductsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use the CustomAppBar as the appBar property instead of in the body
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60), // Adjust height as needed
        child: CustomAppBar(pageName: "Product Details"),
      ),
      body: Column(
        children: [
          // Hero widget with the product image
          Hero(
            tag: product.id!,
            child: Container(
              height: 250,
              width: double.infinity,
              child: Image.network(
                product.images![0],
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    height: 250,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 250,
                    child: Center(
                      child: Icon(Icons.error, size: 50),
                    ),
                  );
                },
              ),
            ),
          ),

          // Product details section
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.brand ?? "",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "${product.price} LE",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "تفاصيل أكتر ...",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  // Add more product details here if needed
                  if (product.description != null) ...[
                    Text(
                      "الوصف:",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      product.description!,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}