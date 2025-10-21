import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laza_shopping/ui/widgets/CustomAuthWidgets/customSwitch.dart';
import 'package:laza_shopping/ui/widgets/CustomAuthWidgets/custom_Button.dart';
import 'package:laza_shopping/ui/widgets/CustomAuthWidgets/custom_ReachText.dart';
import 'package:laza_shopping/ui/widgets/CustomAuthWidgets/custom_password_text_field.dart';

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
  final TextEditingController _fristNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                    return 'Please enter your password';
                  }
                },
                hintText: 'FirstName',
                labelText: 'FirstName',
                controller: _fristNameController,
              ),
              SizedBox(height: 10),
              CustomTextField(
                validator: (value){
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                },
                controller: _lastNameController,
                hintText: 'LastName',
                labelText: 'LastName',


              ),
              SizedBox(height: 10),
              CustomTextField(
                controller: _emailController,
                hintText: 'email',
                labelText: 'email',
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
              SizedBox(height: 10),
              CustomPasswordTextField(
                hint: 'Password',
                lable: 'Password',
                validatorType: ValidatorType.signup,
                controller: _passWordController,
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routs.forgetPasswordScreen);
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
                  Navigator.pushNamed(context, Routs.login_Screen);
                },
              ),
              SizedBox(height: 25),
              CustomButton(title: 'Sign Up', onpress: () {
                if(_formKey.currentState!.validate()){

                }

              }),
            ],
          ),
        ),
      ),
    );
  }
}
