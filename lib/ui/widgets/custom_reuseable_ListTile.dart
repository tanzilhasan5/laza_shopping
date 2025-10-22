
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routs/routs.dart';
import '../../utils/appColor.dart';

class CustomListTile extends StatelessWidget {

  CustomListTile({
    super.key,
     this.lefttitle='',
     this.righttitle='',
    this.ontap, this.lefttextStyle,
    this.righttextStyle,

  });
  final String lefttitle;
  final String righttitle;
  final Function()? ontap;
  final TextStyle?  lefttextStyle;
  final TextStyle ? righttextStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          lefttitle,
          style: lefttextStyle ?? TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        InkWell(
          onTap:ontap, /*(){
            Get.toNamed(Routs.reviewScreen);
          },*/
          child: Text(
            righttitle,
            style: this.righttextStyle ??TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: AppColor.textColor,
            ),
          ),
        ),
      ],
    );
  }
}