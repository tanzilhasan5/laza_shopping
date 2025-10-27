import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:laza_shopping/ui/screen/Addressbook/address_Screen.dart';
import 'package:laza_shopping/ui/screen/CartScreen/cart_Screen.dart';
import 'package:laza_shopping/ui/screen/MyCartScreen/my_cart_screen.dart';
import 'package:laza_shopping/ui/screen/ProductViewScreen/ProductViewScreen.dart';
import 'package:laza_shopping/ui/screen/ReviewScreen/add_review_Screen.dart';
import 'package:laza_shopping/ui/screen/MainBottomNavScreen/main_bottom_nav_bar.dart';
import 'package:laza_shopping/ui/screen/AuthScreen/forget_password_screen.dart';
import 'package:laza_shopping/ui/screen/HomeScreen/home_screen.dart';
import 'package:laza_shopping/ui/screen/AuthScreen/login_Screen.dart';
import 'package:laza_shopping/ui/screen/AuthScreen/newPasswordSet_Screen.dart';
import 'package:laza_shopping/ui/screen/AuthScreen/pinCodeVerification_Screen.dart';
import 'package:laza_shopping/ui/screen/AuthScreen/signup_Screen.dart';
import 'package:laza_shopping/ui/screen/ReviewScreen/review_Screen.dart';
import 'package:laza_shopping/ui/screen/WishListScreen/WishListScreen.dart';
import 'package:laza_shopping/ui/screen/spalish_screen.dart';
import 'package:laza_shopping/ui/widgets/CustomDrawerWidgets/Account_Information/accountInformation.dart';
class Routes{
  static String spalish_Screen='/';
  static String login_Screen='/login_Screen';

  static String signup_Screen='/signup_Screen';
  static String main_buttom_naver='/main_buttom_navern';
  static String home_Screen='/homeScreen';
  static String forgetPasswordScreen='/forgetPasswordScreen';
  static String Pin_verificationScreen='/Pin_verificationScreen';
  static String NewPasswordSetScreen='/NewPasswordSetScreen';
  static String ProductViewScreen='/wishListtScreen';
  static String reviewScreen='/reviewScreen';
  static String addreviewScreen='/addreviewScreen';
  static String cartScreen='/cartScreen';
  static String addressScreen='/addresstScreen';
  static String accountInformationScreen='/accountInformationScreen';
  static String wishListScreen='/wishListtScreen';
  static String my_cart_Screen='/mycartscreen';



}
List<GetPage> pages=[
  GetPage(name: Routes.spalish_Screen, page: ()=>SpalishScreen()),
  GetPage(name: Routes.login_Screen, page: ()=>LoginScreen()),
  GetPage(name: Routes.signup_Screen, page: ()=>SignUpScreen()),
  GetPage(name: Routes.forgetPasswordScreen, page: ()=>ForgetPasswordScreen()),
  GetPage(name: Routes.Pin_verificationScreen, page: ()=>Pin_verification()),
  GetPage(name: Routes.NewPasswordSetScreen, page: ()=>NewPasswordSetScreen()),
  GetPage(name: Routes.home_Screen, page: ()=>HomeScreen()),
  GetPage(name: Routes.main_buttom_naver, page: ()=>MainButtomNavber()),
  GetPage(name: Routes.ProductViewScreen, page: ()=>ProductViewScreen()),
  GetPage(name: Routes.reviewScreen, page: ()=>ReviewScreen()),
  GetPage(name: Routes.addreviewScreen, page: ()=>AddReviewScreen()),
  GetPage(name: Routes.cartScreen, page: ()=>CartScreen()),
  GetPage(name: Routes.addressScreen, page: ()=>AddressScreen()),
  GetPage(name: Routes.accountInformationScreen, page: ()=>AccountInformation()),
  GetPage(name: Routes.wishListScreen, page: ()=>WishListScreen()),
  GetPage(name: Routes.my_cart_Screen, page: ()=>MyCartScreen()),
];
