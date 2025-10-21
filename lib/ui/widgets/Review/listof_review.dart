import 'package:easy_stars/easy_stars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laza_shopping/utils/appColor.dart';

import '../../../routs/routs.dart';

class ListOfReview extends StatelessWidget {
  const ListOfReview({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> ReviewList = [
      {
        'image': 'assets/card_image/card4.png',
        'name': 'Ronaldo Richards',
        'time': '13 Sep, 2020',
        'rating': '4.8',
        'description':
            'Lorem ipsum dolor sit amet, consectetur '
            'adipiscing elit. '
            'Pellentesque malesuada eget vitae amet...',
      },
      {
        'image': 'assets/card_image/card4.png',
        'name': 'Ronaldo Richards',
        'time': '13 Sep, 2020',
        'rating': '4.8',
        'description':
            'Lorem ipsum dolor sit amet, consectetur '
            'adipiscing elit. '
            'Pellentesque malesuada eget vitae amet...',
      },
      {
        'image': 'assets/card_image/card4.png',
        'name': 'Ronaldo Richards',
        'time': '13 Sep, 2020',
        'rating': '4.8',
        'description':
            'Lorem ipsum dolor sit amet, consectetur '
            'adipiscing elit. '
            'Pellentesque malesuada eget vitae amet...',
      },
      {
        'image': 'assets/card_image/card4.png',
        'name': 'Ronaldo Richards',
        'time': '13 Sep, 2020',
        'rating': '4.8',
        'description':
            'Lorem ipsum dolor sit amet, consectetur '
            'adipiscing elit. '
            'Pellentesque malesuada eget vitae amet...',
      },
      {
        'image': 'assets/card_image/card4.png',
        'name': 'Ronaldo Richards',
        'time': '13 Sep, 2020',
        'rating': '4.8',
        'description':
            'Lorem ipsum dolor sit amet, consectetur '
            'adipiscing elit. '
            'Pellentesque malesuada eget vitae amet...',
      },
      {
        'image': 'assets/card_image/card4.png',
        'name': 'Ronaldo Richards',
        'time': '13 Sep, 2020',
        'rating': '4.8',
        'description':
            'Lorem ipsum dolor sit amet, consectetur '
            'adipiscing elit. '
            'Pellentesque malesuada eget vitae amet...',
      },
    ];

    return ListView.separated(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final reviewList = ReviewList[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey,
                        image: DecorationImage(
                          image: AssetImage(reviewList['image']),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          reviewList['name'],
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time_rounded,
                              color: AppColor.textColor,
                              size: 15,
                            ),
                            SizedBox(width: 8),
                            Text(
                              reviewList['time'],
                              style: TextStyle(
                                color: AppColor.textColor,
                                fontSize: 15,
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
                        Text(
                          '4.8',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'rating',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: AppColor.textColor,
                          ),
                        ),
                      ],
                    ),
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
            SizedBox(height: 10),
            Text(
              reviewList['description'],
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: AppColor.textColor,
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 10),
      itemCount: ReviewList.length,
    );
  }
}
