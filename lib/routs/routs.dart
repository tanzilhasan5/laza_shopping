import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:laza_shopping/ui/screen/mainbottomNaver.dart';
import 'package:laza_shopping/ui/screen/AuthScreen/forget_password_screen.dart';
import 'package:laza_shopping/ui/screen/home_screen.dart';
import 'package:laza_shopping/ui/screen/AuthScreen/login_Screen.dart';
import 'package:laza_shopping/ui/screen/AuthScreen/newPasswordSet_Screen.dart';
import 'package:laza_shopping/ui/screen/AuthScreen/pinCodeVerification_Screen.dart';
import 'package:laza_shopping/ui/screen/AuthScreen/signup_Screen.dart';
import 'package:laza_shopping/ui/screen/review_Screen.dart';
import 'package:laza_shopping/ui/screen/spalish_screen.dart';
import 'package:laza_shopping/ui/screen/wishListScreen.dart';

class Routs{
  static String spalish_Screen='/';
  static String login_Screen='/login_Screen';

  static String signup_Screen='/signup_Screen';
  static String main_buttom_naver='/main_buttom_navern';
  static String home_Screen='/homeScreen';
  static String forgetPasswordScreen='/forgetPasswordScreen';
  static String Pin_verificationScreen='/Pin_verificationScreen';
  static String NewPasswordSetScreen='/NewPasswordSetScreen';
  static String wishListtScreen='/wishListtScreen';
  static String reviewScreen='/reviewScreen';
}
List<GetPage> pages=[
  GetPage(name: Routs.spalish_Screen, page: ()=>SpalishScreen()),
  GetPage(name: Routs.login_Screen, page: ()=>LoginScreen()),
  GetPage(name: Routs.signup_Screen, page: ()=>SignUpScreen()),
  GetPage(name: Routs.forgetPasswordScreen, page: ()=>ForgetPasswordScreen()),
  GetPage(name: Routs.Pin_verificationScreen, page: ()=>Pin_verification()),
  GetPage(name: Routs.NewPasswordSetScreen, page: ()=>NewPasswordSetScreen()),
  GetPage(name: Routs.home_Screen, page: ()=>HomeScreen()),
  GetPage(name: Routs.main_buttom_naver, page: ()=>MainButtomNavber()),
  GetPage(name: Routs.wishListtScreen, page: ()=>Wishlistscreen()),
  GetPage(name: Routs.reviewScreen, page: ()=>ReviewScreen()),

];