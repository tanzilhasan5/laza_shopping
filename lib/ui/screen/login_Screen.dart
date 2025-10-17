import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laza_shopping/routs/routs.dart';
import 'package:laza_shopping/ui/widgets/customSwitch.dart';
import 'package:laza_shopping/ui/widgets/custom_Button.dart';
import 'package:laza_shopping/ui/widgets/custom_ReachText.dart';
import 'package:laza_shopping/ui/widgets/custom_password_text_field.dart';
import 'package:laza_shopping/utils/appColor.dart';

import '../widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 105),
                Center(
                  child: Text(
                    'Welcom',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                  ),
                ),
                Center(
                  child: Text(
                    'Please enter your data to continue',
                    style: TextStyle(fontSize: 15, color: AppColor.textColor),
                  ),
                ),
                SizedBox(height: 164),
                CustomTextField(
                  validator:(value){
                    if (value == null || value.isEmpty) {
                      return 'Email cannot be empty';
                    } else if (!value.contains('@')) {
                      return 'Email must contain @';
                    }  else if (!value.contains('gmail')) {
                      return 'Email must contain gmail (gmail)';
                    }
                    else if (!value.contains('.')) {
                      return 'Email must contain . (dot)';
                    }
                    else if (!value.contains('com')) {
                      return 'Email must contain com (com)';
                    }else{
                      return null;
                    }

                  },
                  hintText:'email' ,
                  labelText: 'email',
                  controller: _emailController,
                ),
                SizedBox(height: 20),
                CustomPasswordTextField(
                  hint: 'Password',
                  lable: 'Password',
                  controller: _passWordController,
                  validatorType: ValidatorType.login,
                ),
                SizedBox(height: 10),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: (){
                        Get.toNamed(Routs.forgetPasswordScreen);
                      },
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(fontSize: 15, color: Colors.red),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 41),
                CustomSwitch(
                  title: 'Remember me',
                  initialValue: true,
                  onChanged: (val) {},
                ),
                SizedBox(height: 30),

                CustomButton(title: 'SignIn', onpress: () {
                  if (_formKey.currentState!.validate()) {
                    /*Get.toNamed(Routs.homeScreen);*/
                  }

                }),
                SizedBox(height: 25),
                CustomReachText(
                  context: context,
                  text: 'Dont have an account  ',
                  title: 'Sign Up',
                  ontap: () {
                    Get.toNamed(Routs.signup_Screen);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
