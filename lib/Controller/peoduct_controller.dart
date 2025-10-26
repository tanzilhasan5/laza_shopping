/*
import 'dart:convert';
import 'package:get/get.dart';
import 'package:laza_shopping/Data/models/productMode.dart';

import '../Data/services/api_checker.dart';
import '../Data/services/api_client.dart';
import '../Data/services/api_constant.dart';

class ProductController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<ShoppingProductModel> productList = <ShoppingProductModel>[].obs;

  Future<void> getProducts() async {
      isLoading.value = true;

      final response = await ApiClient.getData(
        ApiConstant.shopingproducts,
      );

      if (response.statusCode == 200) {
        final data = response.body;
        final List<dynamic> productsJson =
        data is Map && data.containsKey('products')
            ? data['products']
            : (data as List<dynamic>);

        productList.value =
            productsJson.map((e) => ShoppingProductModel.fromJson(e)).toList();

        print(' Loaded ${productList.length} products');
      } else {
        ApiChecker.checkApi(response);
        isLoading.value = false;
      }

  }
}
*/
