import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../utils/appColor.dart';

class Customappber extends StatelessWidget {
  Customappber({
    super.key,
    this.leftIcon,
    this.rightIcon,
    this.medelIcon,
    this.leftIconColor = Colors.white,
    this.rightIconColor = Colors.white,
    this.leftonTap,
    this.rightonPress,
  });

  final String? leftIcon;
  final String? rightIcon;
  final String? medelIcon;
  final Color? rightIconColor;
  final Color? leftIconColor;
  final Function()? leftonTap;
  final Function()? rightonPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: leftIconColor,
            child: InkWell(
              onTap: leftonTap,
              child: SvgPicture.asset(leftIcon.toString()),
            ),
          ),
          SvgPicture.asset(medelIcon.toString()),
          CircleAvatar(
            backgroundColor: rightIconColor,
            child: InkWell(
              onTap: rightonPress,
              child: SvgPicture.asset(rightIcon.toString()),
            ),
          ),
        ],
      ),
    );
  }
}
