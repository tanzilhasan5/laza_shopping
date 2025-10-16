import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:laza_shopping/ui/screen/forget_password_screen.dart';
import 'package:laza_shopping/ui/screen/login_Screen.dart';
import 'package:laza_shopping/ui/screen/newPasswordSet_Screen.dart';
import 'package:laza_shopping/ui/screen/pinCodeVerification_Screen.dart';
import 'package:laza_shopping/ui/screen/signup_Screen.dart';
import 'package:laza_shopping/ui/screen/spalish_screen.dart';

class Routs{
  static String spalish_Screen='/';
  static String login_Screen='/login_Screen';
  static String signup_Screen='/signup_Screen';
  static String forgetPasswordScreen='/forgetPasswordScreen';
  static String Pin_verificationScreen='/Pin_verificationScreen';
  static String NewPasswordSetScreen='/NewPasswordSetScreen';
}
List<GetPage> pages=[
  GetPage(name: Routs.spalish_Screen, page: ()=>SpalishScreen()),
  GetPage(name: Routs.login_Screen, page: ()=>LoginScreen()),
  GetPage(name: Routs.signup_Screen, page: ()=>SignUpScreen()),
  GetPage(name: Routs.forgetPasswordScreen, page: ()=>ForgetPasswordScreen()),
  GetPage(name: Routs.Pin_verificationScreen, page: ()=>Pin_verification()),
  GetPage(name: Routs.NewPasswordSetScreen, page: ()=>NewPasswordSetScreen()),
];