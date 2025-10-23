import 'package:flutter/material.dart';

import '../../../utils/appColor.dart';

class CustomTextField extends StatelessWidget {
  String? Function(String?)? validator;


  CustomTextField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.maxline,


  });
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final prefixIcon;
  final suffixIcon;
  final maxline;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxline,
      controller: controller,
      validator: validator ,
      decoration:InputDecoration(
          hintText: hintText,hintStyle: TextStyle(color: AppColor.textColor,fontSize: 11.95),
          labelText: labelText,labelStyle: TextStyle(fontSize: 15,color: Colors.black),
          // suffixText: suffixText,suffixStyle: TextStyle(color: AppColor.textColor,fontSize: 11.95),
          prefixIcon: prefixIcon,prefixIconColor: AppColor.textColor,
          suffixIcon:suffixIcon,suffixIconColor: AppColor.textColor,
          enabledBorder: OutlineInputBorder(

            borderRadius: BorderRadius.circular(8),

            borderSide: BorderSide(
              color: AppColor.backgroundTextfield,
            ),
          ),
          // Focused border
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppColor.backgroundTextfield,  // Border color when focused
              width: 2,          // Border width when focused
            ),
          ),
          errorBorder: OutlineInputBorder(

            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.red, width: 2),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.95),
          ),
      ),
    );
  }
}

