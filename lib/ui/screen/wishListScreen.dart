import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
                SizedBox(height: 15),
                GallerySection(),
                SizedBox(height: 15),
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
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Customsizeguide(text: 'S'),
                    Customsizeguide(text: 'M'),
                    Customsizeguide(text: 'L'),
                    Customsizeguide(text: 'XL'),
                    Customsizeguide(text: '2XL'),
                  ],
                ),
                SizedBox(height: 15),
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
                SizedBox(height: 15),
                Row(children: [WishListReachText()]),
                SizedBox(height: 15),
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
                      onTap: (){},
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
                /*Row(
                  children: [
                    CustomReview()
                  ],
                )*/
                CustomReview()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
