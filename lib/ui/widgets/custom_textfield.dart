import 'package:flutter/material.dart';

import '../../utils/appColor.dart';

/*
class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.obsecureText=false,
  });
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  bool obsecureText;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obsecureText,
      decoration:InputDecoration(
        hintText: hintText,hintStyle: TextStyle(color:Colors.grey,fontSize: 13),
        labelText: labelText,labelStyle: TextStyle(color:Colors.grey,fontSize: 13),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)
        ),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)
        ),
      ),
    );
  }
}*/

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

  });
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final prefixIcon;
  final suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator ,
         /* (value){
        if (value == null || value.isEmpty){
          return  returnText;
        }else{
          return null;
        }
      },*/
      decoration:InputDecoration(
          hintText: hintText,hintStyle: TextStyle(color: AppColor.textColor,fontSize: 11.95),
          labelText: labelText,labelStyle: TextStyle(fontSize: 15,color: Colors.black),
          // suffixText: suffixText,suffixStyle: TextStyle(color: AppColor.textColor,fontSize: 11.95),
          prefixIcon: prefixIcon,prefixIconColor: AppColor.textColor,
          suffixIcon:suffixIcon,suffixIconColor: AppColor.textColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppColor.textColor,  // Border color when not focused
              width: 2,          // Border width when not focused
            ),
          ),
          // Focused border
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppColor.textColor,  // Border color when focused
              width: 2,          // Border width when focused
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.red, width: 2),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.95),
          )
      ),
    );
  }
}
/*
enum Validator {
  email,
  changePassword,
}

String? validateInput(String? value,) {
  if (value == null || value.isEmpty) {
    return 'Field cannot be empty';
  }

  switch (type) {
    case Validator.login:
      if (!value.contains('@')) return 'Enter a valid email address';
      break;

    case Validator.signup:
      if (value.length < 6) return 'Password must be at least 6 characters';
      break;

    case Validator.changePassword:
      if (value.length < 8) return 'New password must be at least 8 characters';
      break;
  }

  return null;
}
*/

