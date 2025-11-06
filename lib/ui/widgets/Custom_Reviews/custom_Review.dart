import 'package:easy_stars/easy_stars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:laza_shopping/Controller/product_review_controller.dart';
import 'package:laza_shopping/Data/models/ProductReview/product_review_Model.dart' hide ProductReviewModel;

import '../../../Data/models/productModel.dart';
import '../../../Data/services/api_constant.dart';
import '../../../utils/appColor.dart';

class CustomReview extends StatelessWidget {
  final Product product;
   CustomReview({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage('${ApiConstant.baseUrl}${product.images}'),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${product.name}',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.access_time_rounded, size: 15),
                        const SizedBox(width: 5),
                        Text(
                          '${
                              product.createdAt ?? DateTime.now().toString()
                          }',
                          style: TextStyle(
                            color: AppColor.textColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('${product.averageRating}', style: TextStyle(fontWeight: FontWeight.w500)),
                    SizedBox(width: 8),
                    Text('rating'),
                  ],
                ),
                EasyStarsDisplay(
                  starSize: 10,
                  allowHalfRating: true,
                  initialRating: 4.5,
                  readOnly: true,
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
