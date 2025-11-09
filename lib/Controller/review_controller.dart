import 'dart:convert';

import 'package:get/get.dart';
import 'package:laza_shopping/Data/models/review_model.dart';

import '../Data/helpers/prefs_helpers.dart';
import '../Data/models/productModel.dart';
import '../Data/services/api_checker.dart';
import '../Data/services/api_client.dart';
import '../Data/services/api_constant.dart';
import '../Data/utils/app_constants.dart';
import '../routs/routs.dart';
import 'package:http/http.dart' as http;


class ReviewController extends  GetxController{

  RxBool isHidden = true.obs;
  var isLoading = false.obs;



  add_review(int productNumber, int ratting ,String comment) async {

    isLoading(true);
    String token = await PrefsHelper.getString(AppConstants.bearerToken);

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var response = await ApiClient.postData(
      ApiConstant.add_product_review,
      jsonEncode(
          {
            "product":productNumber,
            "rating":4.5,
            "comment":comment
          }
      ),
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





}

