import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:laza_shopping/Data/services/api_constant.dart';
import 'package:laza_shopping/utils/appColor.dart';
import '../../../Controller/product_controller.dart';
import '../../../Data/models/productModel.dart';
import '../../../routs/routs.dart';
import '../../../Controller/wishlistController.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({super.key});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  final WishlistController wishlistController = Get.put(WishlistController());
  final ProductController productController = Get.put(ProductController());

  @override
  void initState() {
    productController.fetchProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (productController.isProductLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      return MasonryGridView.count(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        itemCount: productController.productList.length,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        itemBuilder: (context, index) {
          final product = productController.productList[index];
          final isFav = wishlistController.isInWishlist(product.id.toString());

          return ProductCard(
            product: product,
            isFav: isFav,
            wishlistController: wishlistController,
          );
        },
      );
    });
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

  // Helper to get full image URL
  String get _imageUrl {
    final path = product.images?.isNotEmpty == true ? product.images!.first : '';
    return path.isNotEmpty
        ? "${ApiConstant.baseUrl}$path"
        : 'https://via.placeholder.com/150';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.ProductViewScreen, arguments: product);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Hero(
                tag: 'product_${product.id}',
                child: Container(
                  height: 180.h,
                  decoration: BoxDecoration(
                    color: AppColor.circleAvatersColor,
                    borderRadius: BorderRadius.circular(12.r),
                    image: DecorationImage(
                      image: NetworkImage(_imageUrl),
                      fit: BoxFit.cover,
                      onError: (_, __) {},
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 8.h,
                right: 8.w,
                child: Obx(() {
                  final isFav = wishlistController.isInWishlist(product.id.toString());
                  return InkWell(
                    onTap: () {
                      wishlistController.toggleWishlist({
                        "title": product.name ?? "",
                        "price": product.price?.toString() ?? "",
                        "imagePath": _imageUrl, // Full URL
                        "id": product.id.toString(),
                      });
                    },
                    child: Icon(
                      isFav ? Icons.favorite : Icons.favorite_border,
                      color: isFav ? Colors.red : AppColor.textColor,
                      size: 20.sp,
                    ),
                  );
                }),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Text(
            product.name ?? '',
            style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w500),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            product.category ?? '',
            style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w500, color: AppColor.textColor),
          ),
          Text(
            '\$${product.price ?? 0}',
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}