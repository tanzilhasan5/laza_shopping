/*
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laza_shopping/utils/appColor.dart';

class CustomListOfCard extends StatelessWidget {
  final String? imagePath;
  final String? title;
  final String? price;

  const CustomListOfCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return
      Row(
        children: [
          Column(
           crossAxisAlignment:CrossAxisAlignment.start ,
            children: [
              Container(
                width:160 ,
                height: 203,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/card_image/card1.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 140,right: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: (){},
                          child: Icon(Icons.favorite_border,color:AppColor.textColor,))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Text('Nike Sportswear Club',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
              Text(' Fleece',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
              Text('\$99',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
            ],
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

