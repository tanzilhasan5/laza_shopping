
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:laza_shopping/ui/widgets/CustomAuthWidgets/custom_Button.dart';
import 'package:laza_shopping/ui/widgets/Custom_Reviews/custom_Review.dart';
import 'package:laza_shopping/ui/widgets/custom_reuseable_ListTile.dart';
import 'package:laza_shopping/utils/appColor.dart';

import '../../../routs/routs.dart';
import '../../widgets/CustomCardView/custom _card_gelary.dart';
import '../../widgets/CustomCardView/customSizeGuide.dart';
import '../../widgets/CustomCardView/hedder_Image.dart';
import '../../widgets/CustomCardView/card_Reach_Text.dart';

class ProductViewScreen extends StatefulWidget {
  const ProductViewScreen({super.key});

  @override
  State<ProductViewScreen> createState() => _ProductViewScreenState();
}

class _ProductViewScreenState extends State<ProductViewScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderImage(),
                SizedBox(height: 15),
                CustomListTile(
                  lefttitle: 'Mens  Printed Pullover Hoodie',
                  lefttextStyle: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: AppColor.textColor,
                  ),
                  righttitle: 'price',
                ),
                SizedBox(height: 8),
                CustomListTile(
                  lefttitle: 'Nike Club Fleece',
                  righttitle: '\$120',
                  righttextStyle: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                ///<<<<<<<<Nike Club Fleece>>>>>
                SizedBox(height: 10),

                ///<<<<<<<<GallerySection>>>>>
                Center(child: GallerySection()),
                SizedBox(height: 10),
                CustomListTile(lefttitle: 'Size', righttitle: 'Size Guide'),
                SizedBox(height: 10),

                ///<<<<<<<<size Section>>>>>
                Customsizeguide(),
                SizedBox(height: 10),
                CustomListTile(lefttitle: 'Description'),
                SizedBox(height: 10),
                CardListReachText(),

                /// <<<<<<<Driscription>>>>>>
                SizedBox(height: 10),
                CustomListTile(
                  lefttitle: 'Review',
                  righttitle: 'View All',
                  ontap: () {
                    Get.toNamed(Routs.reviewScreen);
                  },
                ),
                SizedBox(height: 15),
                CustomReview(),
                SizedBox(height: 10),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: AppColor.textColor,
                  ),
                ),
                SizedBox(height: 10),
                CustomListTile(
                  lefttitle: 'Total Price',
                  righttitle: '\$125',
                  righttextStyle: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text('with VAT,SD',style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: AppColor.textColor,
                ),),


                SizedBox(height: 10),
                Center(
                  child: CustomButton(title: 'Add to Cart', onpress: () {
                    Get.toNamed(Routs.cartScreen);
                  }),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
