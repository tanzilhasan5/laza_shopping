import 'package:flutter/material.dart';

import '../../../utils/appColor.dart';
import 'custom_password_text_field.dart';

class SolidTextField extends StatelessWidget {

  final TextEditingController? controller;
  String? Function(String?)? validator;
  final String? labelText;
  final String? hintText;
  final prefixIcon;
  final suffixIcon;
  final maxline;

  SolidTextField({

    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.maxline,
    this.validator



  });


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,

      controller: controller,

      decoration: InputDecoration(
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: AppColor.textColor,
            ),
          ),

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: AppColor.textColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.red,
                  width: 2
              )
          )
      ),
    );
  }
}