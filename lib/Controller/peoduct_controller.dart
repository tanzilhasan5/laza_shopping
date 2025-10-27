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
import 'dart:convert';
import 'package:get/get.dart';
import 'package:laza_shopping/Data/services/api_checker.dart';
import 'package:laza_shopping/Data/services/api_client.dart';
import 'package:laza_shopping/Data/services/api_constant.dart';
import '../Data/models/productMode.dart';

class ProductController extends GetxController {
  /// Reactive state variables
  RxBool isLoading = false.obs;
  RxList<Data> productList = <Data>[].obs;

  /// Fetch shopping products from API
  Future<void> getShoppingProducts() async {
    try {
      isLoading.value = true;

      // Add headers if needed (e.g., token or content-type)
      final headers = {
        'Content-Type': 'application/json',
      };

      /// Make GET request
      final response = await ApiClient.getData(
        ApiConstant.shopingproducts,
        headers: headers,
      );

      /// If success
      if (response.statusCode == 200) {
        /// Parse the JSON response
        final decoded = response.body is String
            ? jsonDecode(response.body)
            : response.body;

        /// Convert into model
        final productModel = ShoppingProductModel.fromJson(decoded);

        /// Update product list
        productList.value = productModel.data ?? [];

        print(' Products fetched successfully: ${productList.length}');
      } else {
        ApiChecker.checkApi(response);
        print('Failed to fetch products: ${response.statusText}');
      }
    } catch (e) {
      print(' Error fetching products: $e');
    } finally {
      isLoading.value = false;
    }
  }
}

