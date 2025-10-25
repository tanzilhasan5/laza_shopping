import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../routs/routs.dart';
import '../../../utils/appColor.dart';

class HeaderImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.maxFinite,
          height: 300,
          decoration: BoxDecoration(
            color: Color(0xfff2f2f2),
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage('assets/card_image/card1.png'),
              fit: BoxFit.fitHeight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 188, right: 14, left: 14),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: AppColor.backgroundTextfield,
                  child: IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.main_buttom_naver);
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                ),
                   CircleAvatar(
                    backgroundColor: AppColor.backgroundTextfield,
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.home_Screen);
                      },
                      child: SvgPicture.asset('assets/icon/Bag.svg'),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
