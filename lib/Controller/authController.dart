import 'dart:convert';

import 'package:get/get.dart';
import 'package:laza_shopping/Data/helpers/prefs_helpers.dart';
import 'package:laza_shopping/Data/services/api_checker.dart';
import 'package:laza_shopping/Data/services/api_client.dart';
import 'package:laza_shopping/Data/services/api_constant.dart';
import 'package:laza_shopping/Data/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routs/routs.dart';

class AuthController extends GetxController {

  RxBool isHidden = true.obs;
  var isLoading = false.obs;

  void togglePassword() {
    isHidden.value = !isHidden.value;
  }
  ///<<<<<Login>>>///

  login(String userName, password) async {
    isLoading(true);
    var headers = {'Content-Type': 'application/json'};
    var response = await ApiClient.postData(
      ApiConstant.login,
      jsonEncode({"username":userName , "password": password}),
      headers: headers,
    );
    if (response.statusCode == 200) {
      await PrefsHelper.setString(
        AppConstants.bearerToken,
        response.body['access'],
      );
      Get.offAllNamed(Routes.main_buttom_naver);
    } else {
      ApiChecker.checkApi(response);
    }
    isLoading(false);
  }
  ///<<<<<signUp>>>///

  signUp(firstName, userName, password, email,) async {
    isLoading(true);
    var headers = {'Content-Type': 'application/json'};
    var response = await ApiClient.postData(
      ApiConstant.signup,
      jsonEncode({
        "first_name":firstName,
        "email":email,
        "username": userName,
        "password":password,
      }),
      headers: headers,
    );
    if (response.statusCode == 200) {
      await PrefsHelper.setString(
        AppConstants.bearerToken,
        response.body['access'],
      );
      Get.offAllNamed(Routes.main_buttom_naver);
    } else {
      ApiChecker.checkApi(response);
    }
    isLoading(false);
  }
  ///<<<<<forgetpassword>>>///


  forgetpassword(userName,) async {
    isLoading(true);
    var headers = {'Content-Type': 'application/json'};
    var response = await ApiClient.postData(
      ApiConstant.forgetpassword,
      jsonEncode(
          {
            "username":userName
          }
      ),
      headers: headers,
    );
    if (response.statusCode == 200) {
      Get.offAllNamed(Routes.Pin_verificationScreen, arguments:userName);
    } else {
      ApiChecker.checkApi(response);
    }
    isLoading(false);
  }

  ///<<<<otp>>>>///
  otpVerification(String otp,userName) async {
    isLoading(true);
    var headers = {'Content-Type': 'application/json'};
    var response = await ApiClient.postData(
      ApiConstant.otp(userName),
      jsonEncode(
          {
            "otp":otp
          }
      ),
      headers: headers,
    );
    if (response.statusCode == 200) {
      Get.offAllNamed(Routes.NewPasswordSetScreen,arguments: response.body['access']);
    } else {
      ApiChecker.checkApi(response);
    }
    isLoading(false);
  }
  ///<<<<resetPassword>>>>///

  reset_password(String newpassword, refreshToken) async {
    isLoading(true);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $refreshToken'
    };
    var response = await ApiClient.postData(
      ApiConstant.reset_password,
      jsonEncode(
          {
            "new_password":newpassword,
          }
      ),
      headers: headers ,
    );
    if (response.statusCode == 200) {
      Get.offAllNamed(Routes.home_Screen);
    } else {
      ApiChecker.checkApi(response);
    }
    isLoading(false);
  }
  /*Future<void> getShopingproducts() async {
    try {
      isLoading.value = true;

      // Optional: add custom headers if needed
      final headers = {
        'Content-Type': 'application/json',
      };
      final response = await ApiClient.getData(
        ApiConstant.shopingproducts,
        headers: headers,
      );
      if (response.statusCode == 200) {

        final data = response.body;

        print(' Products fetched: $data');

        Get.offAllNamed(Routes.main_buttom_naver);
      } else {
        ApiChecker.checkApi(response);
        print(' Failed to fetch products: ${response.statusText}');
      }
    } catch (e) {
      print(' Error fetching products: $e');
    } finally {
      isLoading.value = false;
    }
  }
*/





}
