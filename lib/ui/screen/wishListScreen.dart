import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laza_shopping/routs/routs.dart';
import 'package:laza_shopping/ui/widgets/CustomAuthWidgets/custom_Button.dart';
import 'package:laza_shopping/ui/widgets/CustomWishListWidgets/custom%20_card_gelary.dart';
import 'package:laza_shopping/ui/widgets/CustomWishListWidgets/customSizeGuide.dart';
import 'package:laza_shopping/ui/widgets/CustomWishListWidgets/hedder_Image.dart';
import 'package:laza_shopping/ui/widgets/Custom_Reviews/custom_Review.dart';
import 'package:laza_shopping/utils/appColor.dart';

import '../widgets/CustomWishListWidgets/wishlist_Reach_Text.dart';

class Wishlistscreen extends StatefulWidget {
  const Wishlistscreen({super.key});

  @override
  State<Wishlistscreen> createState() => _WishlistscreenState();
}

class _WishlistscreenState extends State<Wishlistscreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                HeaderImage(),
                SizedBox(height: 10),
                GallerySection(),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Size',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Size Guide',
                      style: TextStyle(
                        color: AppColor.textColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Customsizeguide(),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(children: [
                  WishListReachText()
                ]),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Reviews',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    InkWell(
                      onTap: (){
                       Get.toNamed(Routs.reviewScreen);
                      },
                      child: Text(
                        'View All',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: AppColor.textColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                CustomReview(),
                SizedBox(height: 10,),
                Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...',
                  style:TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: AppColor.textColor) ,),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Column(
                    children: [
                      Text('Total Price',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,),),
                      Text('with VAT,SD',style: TextStyle(fontSize: 11,fontWeight: FontWeight.w400,color: AppColor.textColor),)
                    ],
                  ),
                  Text('\$125',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,),)
                ],),
                SizedBox(height: 10,),
                CustomButton(
                  title: 'Add to Cart',
                  onpress: (){},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
