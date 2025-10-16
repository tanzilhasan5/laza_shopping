import 'package:flutter/material.dart';

import '../../utils/appColor.dart';

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
}