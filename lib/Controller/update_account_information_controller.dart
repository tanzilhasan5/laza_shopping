import 'dart:convert';

import 'package:get/get.dart';

import '../Data/helpers/prefs_helpers.dart';
import '../Data/services/api_checker.dart';
import '../Data/services/api_client.dart';
import '../Data/services/api_constant.dart';
import '../Data/utils/app_constants.dart';
import '../routs/routs.dart';

class UpdateuserProfileController extends GetxController{
  var isLoading = false.obs;

  /*updateUserProfile(String fristName, String lastName, String email, String phone, String country, String city, String address) async {
    String? token = await PrefsHelper.getString(AppConstants.bearerToken);
    isLoading(true);
    var headers = {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',

    };
    var response = await ApiClient.putData(
      ApiConstant.updateuserProfile,
      jsonEncode(
          {
            "first_name": fristName,
            "email": email,
            "phone": phone,
            "country": country,
            "city": city,
            "address": address,

          }
      ),
      headers: headers,
    );
    if (response.statusCode == 200) {


      Get.offAllNamed(Routes.main_buttom_naver);
    } else {
      ApiChecker.checkApi(response);
    }
    isLoading(false);
  }*/


  /*updateUserProfile(
      String firstName,
      String lastName,
      String email,
      String phone,
      String country,
      String city,
      String address,
      ) async
  {
    isLoading(true);

    // 🔹 Get stored token from shared prefs
    String? token = await PrefsHelper.getString(AppConstants.bearerToken);

    // 🔹 Include token in header
    var headers = {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };

    var body = jsonEncode({
      "first_name": firstName,
      "email": email,
      "phone": phone,
      "country": country,
      "city": city,
      "address": address,
      "image": "${ApiConstant.baseUrl}/media/profile/Zakaria_1.png",
    });

    print("=====> API Call: ${ApiConstant.updateuserProfile}");
    print("Header: $headers");
    print("=====> API Body: $body");

    var response = await ApiClient.putMultipartData(
      ApiConstant.updateuserProfile,
      body as Map<String, String>,
      headers: headers, multipartBody: [],
    );

    print("==========> Response Post Method :------ : ${response.statusCode}");
    print("=====> API Response: [${response.statusCode}] ${ApiConstant.updateuserProfile}");
    print(response.body);

    if (response.statusCode == 200) {
      await PrefsHelper.setString(
        AppConstants.bearerToken,
        response.body['access'],
      );
      //  Only update token if  API actually returns a new token
      if (response.body is Map && response.body['access'] != null) {
        await PrefsHelper.setString(AppConstants.bearerToken, response.body['access']);
      }

      Get.offAllNamed(Routes.main_buttom_naver);
    } else {
      ApiChecker.checkApi(response);
    }

    isLoading(false);
  }
*/




  updateUserProfile(
      String firstName,
      String lastName,
      String email,
      String phone,
      String country,
      String city,
      String address,
      ) async
  {
    isLoading(true);

    String? token = await PrefsHelper.getString(AppConstants.bearerToken);

    var headers = {
      'Content-Type': 'application/json',
   'Authorization': 'Bearer $token',
    };

    var body = {
      "first_name": firstName,
      "email": email,
      "phone": phone,
      "country": country,
      "city": city,
      "address": address,
    };

    print("=====> API Call: ${ApiConstant.updateuserProfile}");
    print("Header: $headers");
    print("=====> API Body: $body");

    var response = await ApiClient.putData(
      ApiConstant.updateuserProfile,
      body,
      headers: headers,
    );

    print("==========> Response Post Method :------ : ${response.statusCode}");
    print("=====> API Response: [${response.statusCode}] ${ApiConstant.updateuserProfile}");
    print(response.body);

    if (response.statusCode == 200) {
      if (response.body is Map && response.body['access'] != null) {
        await PrefsHelper.setString(AppConstants.bearerToken, response.body['access']);
      }
      Get.offAllNamed(Routes.main_buttom_naver);
    } else {
      ApiChecker.checkApi(response);
    }

    isLoading(false);
  }



}