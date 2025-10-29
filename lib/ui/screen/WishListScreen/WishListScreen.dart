import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:laza_shopping/routs/routs.dart';

import '../../../Controller/product_controller.dart';
import '../../../Data/models/productModel.dart';
import '../../../utils/appColor.dart';
import '../../../Controller/wishlistController.dart';

class WishListScreen extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  final WishlistController wishlistController = Get.put(WishlistController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: ListTile(
          title: Text(
            'WishList',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          trailing: CircleAvatar(
            child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.cartScreen);
                },
                child: SvgPicture.asset('assets/icon/Bag.svg')),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Obx(() {
          final wishlistItems = wishlistController.wishlist;
          final wishlistedProductNames =
              wishlistItems.map((item) => item['title']).toSet();
          final wishlistedProducts = productController.productList
              .where((p) => wishlistedProductNames.contains(p.name))
              .toList();

          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${wishlistedProducts.length} Items',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Available in stock',
                        style: TextStyle(color: AppColor.textColor),
                      ),
                    ],
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: AppColor.circleAvatersColor,
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.sort_outlined, color: Colors.black),
                        Text(
                          'Sort',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              if (wishlistedProducts.isEmpty)
                const Padding(
                  padding: EdgeInsets.only(top: 280),
                  child: Center(child: Text("No favorite items yet")),
                )
              else
                Expanded(
                  child: MasonryGridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    padding: const EdgeInsets.all(12),
                    itemCount: wishlistedProducts.length,
                    itemBuilder: (context, index) {
                      final product = wishlistedProducts[index];
                      final isFav =
                          wishlistController.isInWishlist(product.id.toString());
                      return WishlistCard(
                          product: product,
                          isFav: isFav,
                          wishlistController: wishlistController);
                    },
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }
}

class WishlistCard extends StatelessWidget {
  final Product product;
  final bool isFav;
  final WishlistController wishlistController;

  const WishlistCard({
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
                  final isFav =
                      wishlistController.isInWishlist(product.id.toString());
                  return InkWell(
                    onTap: () => wishlistController.toggleWishlist({
                      "title": product.name ?? "",
                      "price": product.price?.toString() ?? "",
                      "imagePath": product.images?.first ?? "",
                      "id": product.id.toString(),
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
