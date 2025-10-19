import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../utils/appColor.dart';

class WishListReachText extends StatelessWidget {
  const WishListReachText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text:
        'The Nike Throwback Pullover Hoodie is made \n'
            'from premium French terry fabric that blends a \n'
            'performance feel with ',
        style: TextStyle(
          color: AppColor.textColor,
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
        children: [
          TextSpan(
              text: 'Read More..',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
              recognizer: TapGestureRecognizer()..onTap=(){}
          )
        ],
      ),
    );
  }
}