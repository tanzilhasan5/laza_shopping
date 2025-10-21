import 'package:easy_stars/easy_stars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laza_shopping/utils/appColor.dart';


class CustomReview extends StatelessWidget {
  const CustomReview({super.key});

  @override
  Widget build(BuildContext context) {


    return
      Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: Image.asset(
                    'assets/card_image/card1.png',
                    fit: BoxFit.fill,
                  ),
                ),

                Column(
                  children: [
                    Text(
                      'Ronaldo Richards',
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
                          '13 Sep, 2020',
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
                  starSize: 10,
                  allowHalfRating: true,
                  emptyColor: AppColor.textColor,

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
