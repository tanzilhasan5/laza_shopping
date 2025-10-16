import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:laza_shopping/ui/widgets/custom_Button.dart';
import 'package:laza_shopping/ui/widgets/custom_textfield.dart';
import 'package:laza_shopping/utils/appColor.dart';

import '../../routs/routs.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 105),
              Center(
                child: Text(
                  'Forgot Password',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
              ),
              SizedBox(height: 68),

              SvgPicture.asset('assets/image/loginobject.svg'),
              SizedBox(height:80),
              CustomTextField(
                hintText: 'Enter your email',
                labelText:'Enter your email' ,
              ),
              SizedBox(height: 80,),
              Text('Please write your email to receive a\n confirmation code to set a new password.',style: TextStyle(color: AppColor.textColor),),
             SizedBox(height: 10,),
              CustomButton(onpress: (){
                Get.toNamed(Routs.Pin_verificationScreen);
              },
                title: 'Confirm Mail',
              )
            ],
          ),
        ),
      ),
    );
  }
}
