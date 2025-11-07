
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laza_shopping/Data/services/api_constant.dart';
import 'package:laza_shopping/ui/widgets/CustomAuthWidgets/custom_Button.dart';
import 'package:laza_shopping/ui/widgets/custom_reuseable_ListTile.dart';
import 'package:laza_shopping/utils/appColor.dart';
import '../../../Controller/cart_controller.dart';
import '../../../Data/models/productModel.dart';
import '../../../routs/routs.dart';
import '../../widgets/Custom_Reviews/custom_Review.dart';

class ProductViewScreen extends StatelessWidget {
  ProductViewScreen({Key? key}) : super(key: key);

  final AddToCartController cartController = Get.put(AddToCartController());

  @override
  Widget build(BuildContext context) {
    final Product product = Get.arguments as Product;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Get.back(),
                    ),
                    IconButton(
                      icon: const Icon(Icons.favorite_border),
                      onPressed: () {},
                    ),
                  ],
                ),

                // Product Image
                Hero(
                  tag: 'product_${product.id}',
                  child: Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: NetworkImage(
                          "${ApiConstant.baseUrl}${product.images?.isNotEmpty == true ? product.images!.first : ''}",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                // Extra Note
                CustomListTile(
                  lefttitle: product.extraNote ?? 'Product Name',
                  lefttextStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColor.textColor,
                  ),
                  righttitle: 'Price',
                  righttextStyle: TextStyle(
                    fontSize: 13,
                    color: AppColor.textColor,
                  ),
                ),
                const SizedBox(height: 15),

                // Product name & price
                CustomListTile(
                  lefttitle: product.name ?? 'Product Name',
                  lefttextStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColor.textColor,
                  ),
                  righttitle: '\$${product.price ?? 0}',
                  righttextStyle: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 10),

                // Gallery
                GallerySection(product: product),

                const SizedBox(height: 15),

                // Size guide
                CustomListTile(lefttitle: 'Size', righttitle: 'Size Guide'),
                const SizedBox(height: 10),
                CustomSizeGuide(product: product),

                const SizedBox(height: 15),

                // Description
                CustomListTile(lefttitle: 'Description'),
                const SizedBox(height: 8),
                Text(
                  product.description ?? 'No description available.',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: AppColor.textColor,
                  ),
                ),

                const SizedBox(height: 20),

                // Review Section
                CustomListTile(
                  lefttitle: 'Review',
                  righttitle: 'View All',
                  ontap: () {
                    Get.toNamed(Routes.reviewScreen);
                  },
                ),
                const SizedBox(height: 10),
                CustomReview(product: product),

                const SizedBox(height: 15),

                // Total Price
                CustomListTile(
                  lefttitle: 'Total Price',
                  righttitle: '\$${product.price ?? 0}',
                  righttextStyle: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'with VAT, SD',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: AppColor.textColor,
                  ),
                ),

                const SizedBox(height: 15),

                // Add to Cart
                Center(
                  child: CustomButton(
                    title: 'Add to Cart',
                    onpress: () {
                      cartController.addToCart(product);
                      Get.snackbar(
                        'Added to Cart',
                        '${product.name} has been added to your cart.',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    },
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomSizeGuide extends StatelessWidget {
  final Product product;
  const CustomSizeGuide({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> sizes = [];

    final rawSizes = product.sizes;
    if (rawSizes != null) {
      if (rawSizes is List) {
        sizes = rawSizes.map((e) => e.toString()).toList();
      } else if (rawSizes is String) {
        sizes = rawSizes.split(',').map((e) => e.trim()).toList();
      }
    }

    if (sizes.isEmpty) {
      sizes = ['S', 'M', 'L', 'XL', 'XXL'];
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Available Sizes",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 70,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: sizes.length,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (_, index) {
              final size = sizes[index];
              return Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xffF5F6FA),
                  border: Border.all(color: Colors.black12),
                ),
                child: Center(
                  child: Text(
                    size,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

extension on String {
  map(String Function(dynamic e) param0) {}
}

class GallerySection extends StatelessWidget {
  final Product product;
  const GallerySection({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> galleryImages = product.images ?? [];

    return SizedBox(
      height: 80,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: galleryImages.length,
        itemBuilder: (context, index) {
          final imageUrl = "${ApiConstant.baseUrl}${galleryImages[index]}";
          return Padding(
            padding: EdgeInsets.only(right: index == galleryImages.length - 1 ? 0 : 8),
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
