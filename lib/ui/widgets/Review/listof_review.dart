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

  @override
  void initState() {
    super.initState();
    // Fetch product reviews for the given product ID
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount:10,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(0),
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {

        return Card(
          elevation: 0,
          shadowColor: Colors.black12,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'productName',
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
                                  ' 13 Sep, 2020',
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
                              '4.8',
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
                          initialRating: 4.5,
                          readOnly: true,
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // Description
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...',
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
  }
}
*/
import 'package:easy_stars/easy_stars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:laza_shopping/Controller/get_review_controller.dart';
import 'package:laza_shopping/Data/services/api_constant.dart';
import 'package:laza_shopping/utils/appColor.dart';

import '../../../Controller/product_review_controller.dart';
import '../../../Controller/review_controller.dart';
import '../../../Data/models/productModel.dart';
import '../../../Data/models/review_model.dart' hide Product;

class ListOfReview extends StatefulWidget {
  final int? productId; // Now int

  const ListOfReview({Key? key,  this.productId}) : super(key: key);

  @override
  State<ListOfReview> createState() => _ListOfReviewState();
}

class _ListOfReviewState extends State<ListOfReview> {
  late Future<Map<String, dynamic>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = ApiService.fetchProductAndReviews();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(


        future: futureData,
        builder: (context ,snapshot){
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          if (snapshot.hasError)
            return Center(child: Text('Error: ${snapshot.error}'));

          final product = snapshot.data!['product'] as Product;
          final reviews = snapshot.data!['reviews'] as List<Review>;
          return ListView.separated(
            itemCount: 10,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.all(0),
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {

              return Card(
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundImage: NetworkImage(
                                  "${ApiConstant.baseUrl}${product.brand?.brandImage}"
                                ),
                                onBackgroundImageError: (_, __) {},
                              ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name.toString(),
                                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Icon(Icons.access_time_rounded, color: AppColor.textColor, size: 15),
                                      const SizedBox(width: 6),
                                      Text(product.createdAt.toString(), style: TextStyle(fontSize: 14, color: AppColor.textColor)),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Text(product.averageRating ?? '', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                                  const SizedBox(width: 6),
                                  Text('rating', style: TextStyle(fontSize: 14, color: AppColor.textColor)),
                                ],
                              ),
                              const SizedBox(height: 4),
                              /*EasyStarsDisplay(
                                starSize: 16,
                                allowHalfRating: true,
                                emptyColor: AppColor.textColor,
                                initialRating: product.?averageRating,
                                readOnly: true,
                              ),*/
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        product.description.toString(),
                        style: TextStyle(fontSize: 15, color: AppColor.textColor),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
    );
  }
}
