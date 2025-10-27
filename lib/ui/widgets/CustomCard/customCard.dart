import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:laza_shopping/utils/appColor.dart';
import '../../../Controller/product_controller.dart';
import '../../../Data/models/productModel.dart';
import '../../../routs/routs.dart';
import '../../../Controller/wishlistController.dart';

class CustomCard extends StatelessWidget {
  CustomCard({super.key});
  final WishlistController wishlistController = Get.put(WishlistController());
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    productController.getShoppingProducts();
    return
    Obx((){
      if(productController.isLoading.value){
        return const Center(child: CircularProgressIndicator());
      } if(productController.productList.isEmpty){
        return const Center(child: Text('No products available'));
      }
      return  MasonryGridView.count(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        itemCount:productController.productList.length,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) {
          final product =productController.productList[index];
          final isFav = wishlistController.isInWishlist(product.name ??'');
          return ProductCard(
              product: product,
              isFav: isFav,
              wishlistController: wishlistController);
        },
      );
    }

    );
  }
}


class ProductCard extends StatelessWidget {
  final Product product;
  final bool isFav;
  final WishlistController wishlistController;

  const ProductCard({
    super.key,
    required this.product,
    required this.isFav,
    required this.wishlistController,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.ProductViewScreen, arguments: product),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 180,
                decoration: BoxDecoration(
                  color: AppColor.circleAvatersColor,
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(
                      product.images?.isNotEmpty == true
                          ? product.images!.first
                          : 'https://via.placeholder.com/150',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Obx(() {
                  final isFav = wishlistController.isInWishlist(product.name ?? "");
                  return InkWell(
                    onTap: () => wishlistController.toggleWishlist({
                      "title": product.name ?? "",
                      "price": product.price?.toString() ?? "",
                      "imagePath": product.images?.first ?? "",
                    }),
                    child: Icon(
                      isFav ? Icons.favorite : Icons.favorite_border,
                      color: isFav ? Colors.red : AppColor.textColor,
                    ),
                  );
                }),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            product.name ?? '',
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
          ),
          Text(
            product.category ?? '',
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
          ),
          Text(
            '\$${product.price ?? 0}',
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
