import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laza_shopping/ui/widgets/CustomAuthWidgets/customSwitch.dart';
import 'package:laza_shopping/ui/widgets/CustomAuthWidgets/custom_Button.dart';
import 'package:laza_shopping/ui/widgets/CustomAuthWidgets/custom_ReachText.dart';
import 'package:laza_shopping/ui/widgets/CustomAuthWidgets/custom_password_text_field.dart';

import '../../../Controller/authController.dart';
import '../../../routs/routs.dart';
import '../../widgets/CustomAuthWidgets/custom_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 100),
              Center(
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
              ),

              SizedBox(height: 64),
              CustomTextField(
                validator: (value){
                  if (value == null || value.isEmpty) {
                    return 'Please enter your First';
                  }
                },
                hintText: 'FirstName',
                labelText: 'FirstName',
                controller: _firstNameController,
              ),
              SizedBox(height: 10),
              CustomTextField(
                validator: (value){
                  if (value == null || value.isEmpty) {
                    return 'Please enter your UserName';
                  }
                },
                hintText: 'UserName',
                labelText: 'UserName',
                controller: _userNameController,
              ),
              SizedBox(height: 10),
              CustomPasswordTextField(
                hint: 'Password',
                lable: 'Password',
                validatorType: ValidatorType.signup,
                controller: _passWordController,
              ),
              SizedBox(height: 10),
              CustomTextField(
                controller: _emailController,
                hintText: 'Email',
                labelText: ' Email Address',
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
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.forgetPasswordScreen);
                    },
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(fontSize: 15, color: Colors.red),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30),
              CustomSwitch(
                title: 'Remember me',
                initialValue: true,
                onChanged: (val) {},
              ),
              SizedBox(height: 30),
              CustomReachText(
                context: context,
                text: 'Already have an account  ',
                title: 'Login',
                ontap: () {
                  Navigator.pushNamed(context, Routes.login_Screen);
                },
              ),
              SizedBox(height: 25),
              Obx(()=>
                  CustomButton(title: 'SignUp',
                      isLoading: _authController.isLoading.value,
                      onpress: () {
                        if (_formKey.currentState!.validate()) {
                          _authController.signUp(
                            _firstNameController.text.trim(),
                            _userNameController.text.trim(),
                              _passWordController.text,

                            _emailController.text.trim()
                          );

                        }

                      }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
