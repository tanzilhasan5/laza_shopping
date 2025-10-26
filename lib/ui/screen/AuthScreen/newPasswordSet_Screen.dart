import 'package:flutter/material.dart' hide Router;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:laza_shopping/ui/widgets/CustomAuthWidgets/custom_Button.dart';
import 'package:laza_shopping/ui/widgets/CustomAuthWidgets/custom_textfield.dart';
import 'package:laza_shopping/utils/appColor.dart';

import '../../../Controller/authController.dart';
import '../../../routs/routs.dart';

class NewPasswordSetScreen extends StatefulWidget {
  const NewPasswordSetScreen({super.key});

  @override
  State<NewPasswordSetScreen> createState() => _NewPasswordSetScreenState();
}

class _NewPasswordSetScreenState extends State<NewPasswordSetScreen> {
  final AuthController _authController = Get.put(AuthController());
  final TextEditingController _conformPassWordlController = TextEditingController();
  final TextEditingController _PassWordController = TextEditingController();
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
                  controller: _PassWordController,
                  hintText: 'Password',
                  labelText: 'Enter your Pasword',
                ),
                SizedBox(height: 20),
                CustomTextField(
                  controller: _conformPassWordlController,
                  hintText: 'Confirm Password',
                  labelText: 'Enter your Confirm Password',
                  validator: (v) {
                    if (_PassWordController.text != v) {
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
                Obx(() => CustomButton(
                  isLoading: _authController.isLoading.value,
                    onpress: () {
                      if (_formKey.currentState!.validate()) {
                        _authController.reset_password(_PassWordController.text,Get.arguments);
                      }
                    },
                    title: 'reset_password',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
