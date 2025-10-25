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
      Get.offAllNamed(Routs.main_buttom_naver);
    } else {
      ApiChecker.checkApi(response);
    }
    isLoading(false);
  }


}
