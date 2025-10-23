
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:laza_shopping/ui/screen/Addressbook/address_Screen.dart';
import 'package:laza_shopping/ui/screen/ReviewScreen/add_review_Screen.dart';
import 'package:laza_shopping/ui/screen/MainBottomNavScreen/mainbottomNaver.dart';
import 'package:laza_shopping/ui/screen/AuthScreen/forget_password_screen.dart';
import 'package:laza_shopping/ui/screen/HomeScreen/home_screen.dart';
import 'package:laza_shopping/ui/screen/AuthScreen/login_Screen.dart';
import 'package:laza_shopping/ui/screen/AuthScreen/newPasswordSet_Screen.dart';
import 'package:laza_shopping/ui/screen/AuthScreen/pinCodeVerification_Screen.dart';
import 'package:laza_shopping/ui/screen/AuthScreen/signup_Screen.dart';
import 'package:laza_shopping/ui/screen/ReviewScreen/review_Screen.dart';
import 'package:laza_shopping/ui/screen/spalish_screen.dart';
import 'package:laza_shopping/ui/widgets/CustomDrawerWidgets/Account_Information/accountInformation.dart';
import '../ui/screen/CardView/CardViewScreen.dart';
import '../ui/screen/MyCartScreen/my_cart_Screen.dart';

class Routs{
  static String spalish_Screen='/';
  static String login_Screen='/login_Screen';

  static String signup_Screen='/signup_Screen';
  static String main_buttom_naver='/main_buttom_navern';
  static String home_Screen='/homeScreen';
  static String forgetPasswordScreen='/forgetPasswordScreen';
  static String Pin_verificationScreen='/Pin_verificationScreen';
  static String NewPasswordSetScreen='/NewPasswordSetScreen';
  static String CardViewScreen='/wishListtScreen';
  static String reviewScreen='/reviewScreen';
  static String addreviewScreen='/addreviewScreen';
  static String mycartScreen='/mycartScreen';
  static String addressScreen='/addresstScreen';
  static String accountInformationScreen='/accountInformationScreen';



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
  GetPage(name: Routs.CardViewScreen, page: ()=>CardView()),
  GetPage(name: Routs.reviewScreen, page: ()=>ReviewScreen()),
  GetPage(name: Routs.addreviewScreen, page: ()=>AddReviewScreen()),
  GetPage(name: Routs.mycartScreen, page: ()=>MyCartScreen()),
  GetPage(name: Routs.addressScreen, page: ()=>AddressScreen()),
  GetPage(name: Routs.accountInformationScreen, page: ()=>AccountInformation()),

];