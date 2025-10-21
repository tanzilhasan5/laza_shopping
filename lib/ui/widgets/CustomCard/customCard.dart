/*

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laza_shopping/utils/appColor.dart';

import '../../../routs/routs.dart';

class CustomCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String downtext;
  final String price;
  final String secondimagePath;
  final String secondtitle;
  final String seconddowntext;
  final String secondprice;


  const CustomCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.downtext,
    required this.secondimagePath,
    required this.secondtitle,
    required this.seconddowntext,
    required this.secondprice,
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        InkWell(
          onTap: (){},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 150,
                height: 203,
                decoration: BoxDecoration(
                  color: AppColor.circleAvatersColor,
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(imagePath.toString()),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 140, right: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routs.wishListtScreen);
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
              const SizedBox(width: 10,),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                downtext,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '\$$price',
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 15,),
        InkWell(
          onTap: (){},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 150,
                height: 203,
                decoration: BoxDecoration(
                  color: AppColor.circleAvatersColor,
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(secondimagePath.toString()),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 140, right: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routs.wishListtScreen);
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
                secondtitle,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                seconddowntext,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '\$$secondprice',
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }
}

*/


import 'package:flutter/material.dart';
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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 items per row
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: .6, // controls height/width ratio
        ),
        itemCount: cardItems.length,
        itemBuilder: (context, index) {
          final item = cardItems[index];
          return _buildCard(item);
        },
      ),
    );
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
                fit: BoxFit.cover,
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
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            item['downtext']!,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '\$${item['price']}',
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
