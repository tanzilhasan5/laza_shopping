import 'dart:convert';
import 'package:get/get.dart';
import 'package:laza_shopping/Data/services/api_checker.dart';
import 'package:laza_shopping/Data/services/api_client.dart';
import 'package:laza_shopping/Data/services/api_constant.dart';
import '../Data/models/productModel.dart';

class ProductController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<Product> productList = <Product>[].obs;

  Future<void> getShoppingProducts() async {
    try {
      isLoading.value = true;
      final headers = {
        'Content-Type': 'application/json',
      };
      final response = await ApiClient.getData(
        ApiConstant.shopingproducts,
        headers: headers,
      );
      if (response.statusCode == 200) {
        final decoded = response.body is String
            ? jsonDecode(response.body)
            : response.body;
        final productResponse = ProductModel.fromJson(decoded);
        productList.value = productResponse.data ?? [];
        print('✅ Products fetched successfully: ${productList.length}');
      } else {
        ApiChecker.checkApi(response);
        print('❌ Failed to fetch products: ${response.statusText}');
      }
    } catch (e) {
      print('⚠️ Error fetching products: $e');
    } finally {
      isLoading.value = false;
    }
  }
}