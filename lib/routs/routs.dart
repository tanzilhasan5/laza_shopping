import 'package:flutter/cupertino.dart';
import 'package:laza_shopping/ui/screen/login_Screen.dart';
import 'package:laza_shopping/ui/screen/signup_Screen.dart';
import 'package:laza_shopping/ui/screen/spalish_screen.dart';

class Routs{
  static String spalish_Screen='/';
  static String login_Screen='/login_Screen';
  static String signup_Screen='/signup_Screen';
}
Map <String,WidgetBuilder> pages ={
Routs.spalish_Screen:(_)=>SpalishScreen(),
Routs.login_Screen:(_)=>LoginScreen(),
Routs.signup_Screen:(_)=>SignUpScreen(),
};