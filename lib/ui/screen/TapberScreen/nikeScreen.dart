import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:laza_shopping/utils/appColor.dart';

import '../../../routs/routs.dart';
import '../../widgets/CustomCard/customCard.dart';

class NikeScreen extends StatelessWidget {
  const NikeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: ListTile(
          title: SvgPicture.asset('assets/brand_logo/nike.svg'),
          trailing: CircleAvatar(
            child: InkWell(
              onTap: (){Get.toNamed(Routs.cartScreen);},
                child: SvgPicture.asset('assets/icon/Bag.svg')),
          ),
        ),
      ),
      body:
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '365 Items',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Available in stock',
                      style: TextStyle(color: AppColor.textColor),
                    ),
                  ],
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: AppColor.circleAvatersColor,
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.sort_outlined, color: Colors.black),
                      Text(
                        'Sort',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            CustomCard()

          ],
        ),
      ),
    );
  }
}
