import 'package:flutter/material.dart';
import 'package:laza_shopping/ui/widgets/customSwitch.dart';
import 'package:laza_shopping/ui/widgets/custom_Button.dart';
import 'package:laza_shopping/ui/widgets/custom_ReachText.dart';
import 'package:laza_shopping/utils/appColor.dart';

import '../../routs/routs.dart';
import '../widgets/custom_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController =TextEditingController();
  final TextEditingController _passWordController =TextEditingController();
  final TextEditingController _fristNameController =TextEditingController();
  final TextEditingController _lastNameController =TextEditingController();
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
              ),

              SizedBox(height: 64,),
              CustomTextField(
                controller: _fristNameController,
                hintText: 'FristName',
                labelText: 'FristName',
              ),
              SizedBox(height: 10,),
              CustomTextField(
                controller: _lastNameController,
                hintText: 'LastName',
                labelText: 'LastName',
              ),
              SizedBox(height: 10,),
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
              CustomReachText(context: context, text: 'Already have an account  '  , title: 'Login', ontap: (){Navigator.pushNamed(context, Routs.login_Screen);}),
              SizedBox(height: 25,),
              CustomButton(title: 'SignUp',onpress: (){},)




            ],
          ),
        ),
      ),
    );
  }
}

