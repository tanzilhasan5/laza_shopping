
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:laza_shopping/utils/appColor.dart';
import '../../../routs/routs.dart';
import '../../../Controller/wishlistController.dart';

class CustomCard extends StatelessWidget {
  CustomCard({super.key});

  final WishlistController wishlistController = Get.put(WishlistController());

  final List<Map<String, String>> products = [
    {
      "imagePath": "assets/card_image/card1.png",
      "title": "Nike Air Max",
      "downtext": "Running Shoes",
      "price": "120"
    },
    {
      "imagePath": "assets/card_image/card2.png",
      "title": "Adidas Ultra",
      "downtext": "Sport Shoes",
      "price": "100"
    },
    {
      "imagePath": "assets/card_image/card1.png",
      "title": "Puma Slip-On",
      "downtext": "Casual Shoes",
      "price": "80"
    },
    {
      "imagePath": "assets/card_image/card1.png",
      "title": "Converse Chuck Taylor",
      "downtext": "Athletic Shoes",
      "price": "90"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      itemCount: products.length,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      padding: const EdgeInsets.all(12),
      itemBuilder: (context, index) {
        final item = products[index];
        final isFav = wishlistController.isInWishlist(item['title']!);
        return ProductCard(item: item, isFav: isFav, wishlistController: wishlistController);
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  final Map<String, String> item;
  final bool isFav;
  final WishlistController wishlistController;

  const ProductCard({
    super.key,
    required this.item,
    required this.isFav,
    required this.wishlistController,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.ProductViewScreen),
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
                    image: AssetImage(item['imagePath']!),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Obx(() {
                  final isFav = wishlistController.isInWishlist(item['title']!);
                  return InkWell(
                    onTap: () => wishlistController.toggleWishlist(item),
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
          Text(item['title']!, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500)),
          Text(item['downtext']!, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500)),
          Text('\$${item['price']}', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

