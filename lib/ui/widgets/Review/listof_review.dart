/*
import 'package:easy_stars/easy_stars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laza_shopping/Data/services/api_constant.dart';
import 'package:laza_shopping/utils/appColor.dart';

import '../../../Controller/product_review_controller.dart';

class ListOfReview extends StatefulWidget {
  final String productId; // <-- Pass product ID dynamically

  const ListOfReview({Key? key, required this.productId}) : super(key: key);

  @override
  State<ListOfReview> createState() => _ListOfReviewState();
}

class _ListOfReviewState extends State<ListOfReview> {
  final ReviewController reviewController = Get.put(ReviewController());

  @override
  void initState() {
    super.initState();
    // Fetch product reviews for the given product ID
    reviewController.fetchReview(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (reviewController.isBrandLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (reviewController.productReviewList.isEmpty) {
        return const Center(
          child: Text('No reviews available'),
        );
      }

      return ListView.separated(
        itemCount: reviewController.productReviewList.length,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final review = reviewController.productReviewList[index];
          final product = review.product;

          final imageUrl = (product?.images != null &&
              product!.images!.isNotEmpty)
              ? '${ApiConstant.baseUrl}${product.images}'
              : 'assets/images/placeholder.png';

          final rating = review.rating?.toDouble() ?? 0.0;
          final totalReviews = product?.totalReviews ?? 0;
          final productName = product?.name ?? '';
          final description = product?.description ?? '';

          return Card(
            elevation: 3,
            shadowColor: Colors.black12,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Row — Image, Name, Time, Rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: imageUrl.startsWith('http')
                                ? NetworkImage(imageUrl)
                                : AssetImage(imageUrl) as ImageProvider,
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                productName,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(
                                    Icons.access_time_rounded,
                                    color: AppColor.textColor,
                                    size: 15,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    '$totalReviews Reviews',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: AppColor.textColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      // Rating Section
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Text(
                                rating.toStringAsFixed(1),
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                'rating',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColor.textColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          EasyStarsDisplay(
                            starSize: 16,
                            allowHalfRating: true,
                            emptyColor: AppColor.textColor,
                            initialRating: rating,
                            readOnly: true,
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Description
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColor.textColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_stars/easy_stars.dart';
import 'package:laza_shopping/utils/appColor.dart';
import '../../../Controller/product_review_controller.dart';
import '../../../Data/services/api_constant.dart';

class ListOfReview extends StatefulWidget {
  final String productId;

  const ListOfReview({Key? key, required this.productId}) : super(key: key);

  @override
  State<ListOfReview> createState() => _ListOfReviewState();
}

class _ListOfReviewState extends State<ListOfReview> {
  final ReviewController reviewController = Get.put(ReviewController());

  @override
  void initState() {
    super.initState();
    reviewController.fetchReview(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (reviewController.isBrandLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      final productData = reviewController.productReview.value;
      if (productData == null || productData.reviews == null || productData.reviews!.isEmpty) {
        return const Center(child: Text('No reviews available.'));
      }

      final product = productData.product;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (product != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name ?? '', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('${product.averageRating} ★ (${product.totalReviews} reviews)'),
                const SizedBox(height: 10),
              ],
            ),
          ListView.builder(
            itemCount: productData.reviews!.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final review = productData.reviews![index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: review.user?.image != null
                      ? NetworkImage('${ApiConstant.baseUrl}/${review.user!.image!}')
                      : null,
                  child: review.user?.image == null ? const Icon(Icons.person) : null,
                ),
                title: Text(review.user?.firstName ?? 'Unknown User'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EasyStarsDisplay(
                      initialRating: review.rating ?? 0.0,
                      readOnly: true,
                      starSize: 16,
                      emptyColor: AppColor.textColor,
                    ),
                    Text(review.comment ?? ''),
                  ],
                ),
              );
            },
          ),
        ],
      );
    });
  }
}

