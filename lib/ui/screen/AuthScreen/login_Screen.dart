import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laza_shopping/routs/routs.dart';
import 'package:laza_shopping/ui/widgets/CustomAuthWidgets/customSwitch.dart';
import 'package:laza_shopping/ui/widgets/CustomAuthWidgets/custom_Button.dart';
import 'package:laza_shopping/ui/widgets/CustomAuthWidgets/custom_ReachText.dart';
import 'package:laza_shopping/ui/widgets/CustomAuthWidgets/custom_password_text_field.dart';
import 'package:laza_shopping/utils/appColor.dart';

import '../../../Controller/authController.dart';
import '../../widgets/CustomAuthWidgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final AuthController _authController = Get.put(AuthController());


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
                      return 'User Name cannot be empty';
                    }
                      return null;
                  },
                  hintText:'User Name',
                  labelText: 'User Name',
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
                       Get.toNamed(Routes.forgetPasswordScreen);
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

                Obx(()=>
                   CustomButton(title: 'LogIn',
                      isLoading: _authController.isLoading.value,
                      onpress: () {
                    if (_formKey.currentState!.validate()) {
                      _authController.login(_emailController.text.trim(),_passWordController.text);

                    }

                  }),
                ),
                SizedBox(height: 25),
                CustomReachText(
                  context: context,
                  text: 'Dont have an account  ',
                  title: 'Sign Up',
                  ontap: () {
                    Get.toNamed(Routes.signup_Screen);
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
