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
