import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:laza_shopping/utils/appColor.dart';
import '../../../routs/routs.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> cardItems = [
      {
        'imagePath': 'assets/card_image/card1.png',
        'title': 'Nike Air Max',
        'downtext': 'Running Shoes',
        'price': '120',
      },
      {
        'imagePath': 'assets/card_image/card2.png',
        'title': 'Adidas Ultra',
        'downtext': 'Sport Shoes',
        'price': '100',
      },
      {
        'imagePath': 'assets/card_image/card1.png',
        'title': 'Puma Slip-On',
        'downtext': 'Casual Shoes',
        'price': '80',
      },
      {
        'imagePath': 'assets/card_image/card1.png',
        'title': 'Converse Chuck Taylor',
        'downtext': 'Athletic Shoes',
        'price': '90',
      },
    ];

    return MasonryGridView.count(
      itemCount: cardItems.length,
        crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final item = cardItems[index];
        return _buildCard(item);
      },);
  }

  Widget _buildCard(Map<String, String> item) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routs.CardViewScreen);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              color: AppColor.circleAvatersColor,
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(item['imagePath']!),
                fit: BoxFit.fill,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 130, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      //Get.toNamed(Routs.);
                    },
                    child: Icon(
                      Icons.favorite_border,
                      color: AppColor.textColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            item['title']!,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            item['downtext']!,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            '\$${item['price']}',
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
