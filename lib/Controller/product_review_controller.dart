/*

import 'package:get/get.dart';
import 'package:laza_shopping/Data/models/ProductReview/product_review_Model.dart';
import 'package:laza_shopping/Data/services/api_checker.dart';
import 'package:laza_shopping/Data/services/api_client.dart';
import 'package:laza_shopping/Data/services/api_constant.dart';


class ReviewController extends GetxController{

  var isbrandLoding = false.obs;

  RxList<ProductReviewModel> productReviewList = <ProductReviewModel>[].obs;


  Future<void> fetchReview(id)async{

    isbrandLoding(true);

    final response = await ApiClient.getData(ApiConstant.productReview(id));
    if(response.statusCode == 200){

      List<dynamic> data = response.body['data'];
      productReviewList.value = data.map((e) => ProductReviewModel.fromJson(e)).toList();
    }else{
      ApiChecker.checkApi(response);
    }
    isbrandLoding(false);


  }
}

*/
import 'dart:ffi';

import 'package:get/get.dart';
import 'package:laza_shopping/Data/models/ProductReview/product_review_Model.dart';
import 'package:laza_shopping/Data/services/api_checker.dart';
import 'package:laza_shopping/Data/services/api_client.dart';
import 'package:laza_shopping/Data/services/api_constant.dart';

class ReviewController extends GetxController {
  var isBrandLoading = false.obs;

  Rxn<ProductReviewModel> productReview = Rxn<ProductReviewModel>();

  Future<void> fetchReview(String productId) async {
    try {
      isBrandLoading(true);

      final response = await ApiClient.getData(ApiConstant.productReview(productId as Int));

      if (response.statusCode == 200 && response.body != null) {
        productReview.value = ProductReviewModel.fromJson(response.body);
      } else {
        ApiChecker.checkApi(response);
      }
    } catch (e) {
      print(" Error fetching reviews: $e");
    } finally {
      isBrandLoading(false);
    }
  }
}
