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
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.backgroundTextfield,  // Border color when not focused
            width: 2,          // Border width when not focused
          ),),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color:AppColor.backgroundTextfield, width: 2),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.backgroundTextfield, width:2),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.backgroundTextfield, width: 0),
        ),
      ),
    );
  }
}

