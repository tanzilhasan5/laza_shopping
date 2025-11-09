import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laza_shopping/Controller/product_controller.dart';
import 'package:laza_shopping/ui/widgets/CustomCard/customCard.dart';

class BrandScreen extends StatelessWidget {
  final String brandName;
  const BrandScreen({super.key, required this.brandName});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find<ProductController>();
    final brandProducts = productController.productList
        .where((product) =>
            product.brand?.name?.toLowerCase() == brandName.toLowerCase())
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(brandName),
      ),
      body:
      brandProducts.isEmpty
          ? const Center(
              child: Text('No products found for this brand'),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.71,
              ),
              itemCount: brandProducts.length,
              itemBuilder: (context, index) {
                final product = brandProducts[index];
                return ProductCard(
                  product: product,
                  isFav: false,
                  wishlistController: Get.find(),
                );
              },
            ),
    );
  }
}
