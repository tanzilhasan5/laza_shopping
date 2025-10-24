
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/appColor.dart';
import '../../../Controller/authController.dart';


class CustomPasswordTextField extends StatelessWidget {
  final String hint;
  final String lable;
  final TextEditingController? controller;
  final ValidatorType validatorType;

  CustomPasswordTextField({
    Key? key,
    this.hint = "Password",
    this.controller,
    this.validatorType = ValidatorType.login,
    this.lable ='Password',
  }) : super(key: key);

  final PasswordController passwordController = Get.put(PasswordController());

  String? _validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    switch (validatorType) {
      case ValidatorType.login:
      // Only empty check
        return null;

      case ValidatorType.signup:
        if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        if (!RegExp(r'[A-Z]').hasMatch(value)) {
          return 'Must contain at least one uppercase letter';
        }
        if (!RegExp(r'[0-9]').hasMatch(value)) {
          return 'Must contain at least one number';
        }
        return null;

      case ValidatorType.changePassword:
        if (value.length < 8) {
          return 'New password must be at least 8 characters';
        }
        if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(value)) {
          return 'Must include at least one special character';
        }
        return null;

    }

  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth < 400 ? 14 : 16;

    return Obx(() => TextFormField(
      controller: controller,
      obscureText: passwordController.isHidden.value,
      validator: _validate,
      style: TextStyle(fontSize: fontSize),
      decoration:
      InputDecoration(
        hintText: hint,hintStyle: TextStyle(color: AppColor.textColor,fontSize: 11.95),
       labelText: lable, labelStyle: TextStyle(color: Colors.black,fontSize: 11.95),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColor.backgroundTextfield,  // Border color when not focused
            width: 2,          // Border width when not focused
          ),),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.95),
          borderSide: BorderSide(color:AppColor.backgroundTextfield, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColor.backgroundTextfield, width:2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColor.backgroundTextfield, width: 0),
        ),

        suffixIcon: IconButton(
          icon: Icon(
            passwordController.isHidden.value
                ? Icons.visibility_off
                : Icons.visibility,
          ),
          onPressed: passwordController.togglePassword,
        ),
      ),
    ));
  }
}
enum ValidatorType {
  login,
  signup,
  changePassword,
}

