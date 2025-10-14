import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:laza_shopping/utils/appColor.dart';

class CustomReachText extends StatelessWidget {
  const CustomReachText({
    super.key,
    required this.context,
    required this.text,
    required this.title,
    required this.ontap,
  });

  final BuildContext context;
  final String text;
  final String title;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: text,
          style:
          const TextStyle(color: Colors.black54, fontWeight: FontWeight.w600),
          children: [
            TextSpan(
              text: title,
              style: TextStyle(
                color: Colors.black
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = ontap,
            )
          ],
        ),
      ),
    );
  }
}
