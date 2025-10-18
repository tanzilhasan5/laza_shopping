import 'package:flutter/material.dart';

import '../../../utils/appColor.dart';
class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    this.title, this.onpress,
  });
  final String? title;
  final Function ()? onpress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      backgroundColor: AppColor.primaryColors,
      minimumSize: const Size(355, 50),
      maximumSize: Size.infinite,
    ),
        onPressed:onpress, child: Text(title!,style: TextStyle(color: Colors.white),));
  }
}


