import 'package:flutter/material.dart';
import 'package:laza_shopping/routs/routs.dart';
import 'package:laza_shopping/ui/widgets/customSwitch.dart';
import 'package:laza_shopping/ui/widgets/custom_Button.dart';
import 'package:laza_shopping/ui/widgets/custom_ReachText.dart';
import 'package:laza_shopping/utils/appColor.dart';

import '../widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController =TextEditingController();
  final TextEditingController _passWordController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body: SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children:[
            SizedBox(height: 105,),
          Center(
            child: Text('Welcom',style: TextStyle(
                fontSize: 28
            ),),
          ), Center(
            child: Text('Please enter your data to continue',style: TextStyle(
                fontSize: 15,color: AppColor.textColor,
            ),),
          ),
          SizedBox(height: 64,),
          CustomTextField(
            controller: _emailController,
            hintText: 'email',
            labelText: 'email',
          ),
          SizedBox(height: 10,),
          CustomTextField(
            controller: _passWordController,
            hintText: 'passwor',
            labelText: 'password',
            obsecureText: true,
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Forgot password?',style: TextStyle(fontSize: 15,color: Colors.red),)
            ],
          ),
    
          SizedBox(height: 30,),
          CustomSwitch(title: 'Remember me', initialValue: true, onChanged:(val){} ),
          SizedBox(height: 30,),
          CustomReachText(context: context, text: 'Dont have an account  '  , title: 'Sign Up', ontap: (){
            Navigator.pushNamed(context, Routs.signup_Screen);

          }),
          SizedBox(height: 25,),
         CustomButton(title: 'SignIn',onpress: (){
         },)
          
          
    
    
        ],
      ),
    ),
  ),
    );
  }
}

