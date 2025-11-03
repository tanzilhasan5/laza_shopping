
import 'dart:ffi';

class ApiConstant{

  static String baseUrl="https://e-bazar-latest.onrender.com";

  static String login="/auth/login/";
  static String signup="/auth/signup/";
  static String forgetpassword="/auth/forgetpassword/";
  static String otp(String userName)=>"/auth/vefiry_for_forget/$userName/";
  static String productView(Int id)=>"/shoping/products/$id/";
  static String reset_password="/auth/reset_password/";
  static String shopingproducts="/shoping/products/";
  static String brands="/shoping/brands/";
  static String userProfile="/auth/profile/";
  static String updateuserProfile="/auth/profile/";
  static String terms_condition="/auth/terms";
  static String privacypolicy="/auth/privacy-policy/";
  static String about_us="/auth/about-us/";
  static String productReview(Int id)=>"/shoping/products/reviews/$id/";



}