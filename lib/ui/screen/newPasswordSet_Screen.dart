import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:laza_shopping/ui/widgets/custom_Button.dart';
import 'package:laza_shopping/ui/widgets/custom_textfield.dart';
import 'package:laza_shopping/utils/appColor.dart';

import '../../routs/routs.dart';

class NewPasswordSetScreen extends StatefulWidget {
  const NewPasswordSetScreen({super.key});

  @override
  State<NewPasswordSetScreen> createState() => _NewPasswordSetScreenState();
}

class _NewPasswordSetScreenState extends State<NewPasswordSetScreen> {
  final TextEditingController _conformPassWordlController =
      TextEditingController();
  final TextEditingController _passWordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 105),
                Center(
                  child: Text(
                    'New Password',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                  ),
                ),
                SizedBox(height: 68),
                SizedBox(height: 80),
                CustomTextField(
                  controller: _passWordController,
                  hintText: 'Password',
                  labelText: 'Enter your Pasword',
                ),
                SizedBox(height: 20),
                CustomTextField(
                  hintText: 'Confirm Password',
                  labelText: 'Enter your Confirm Password',
                  validator: (v) {
                    if (_passWordController.text != v) {
                      return "Password not match";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 200),
                Text(
                  'Please write your new password.',
                  style: TextStyle(color: AppColor.textColor),
                ),
                SizedBox(height: 10),
                CustomButton(
                  onpress: () {
                    if (_formKey.currentState!.validate()) {
                      Get.toNamed(Routs.Pin_verificationScreen);
                    }
                  },
                  title: 'Reset Password',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
