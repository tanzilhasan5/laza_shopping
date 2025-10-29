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


/*
import 'dart:convert';
import 'package:get/get.dart';
import 'package:laza_shopping/Data/services/api_checker.dart';
import 'package:laza_shopping/Data/services/api_client.dart';
import 'package:laza_shopping/Data/services/api_constant.dart';
import '../Data/models/productMode.dart';

class BrandsController extends GetxController {
  /// Reactive state variables
  RxBool isLoading = false.obs;
  RxList<Data> brandstList = <Data>[].obs;

  /// Fetch shopping products from API
  Future<void> getShoppingProducts() async {
    try {
      isLoading.value = true;

      final headers = {
        'Content-Type': 'application/json',
      };

      /// Make GET request
      final response = await ApiClient.getData(
        ApiConstant.brands,
        headers: headers,
      );

      if (response.statusCode == 200) {
        /// Parse the JSON response
        final decoded = response.body is String
            ? jsonDecode(response.body)
            : response.body;

        /// Convert into model
        final productModel = ShoppingProductModel.fromJson(decoded);

        /// Update product list
        brandstList.value = productModel.data ?? [];

        print(' Products fetched successfully: ${brandstList.length}');
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
*/


/*
import 'package:get/get.dart';
import 'package:laza_shopping/Data/services/api_constant.dart';
import '../Data/models/brands_model.dart';
import '../Data/services/api_client.dart'; // use your actual API client

class BrandsController extends GetxController {
  var isLoading = false.obs;
  var brandstList = <BrandData>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchBrands();
  }

  void fetchBrands() async {
    isLoading.value = true;
    try {
      final response = await ApiClient.getData(ApiConstant.brands); // your API endpoint

      if (response.statusCode == 200) {
        final model = BrandsModel.fromJson(response.body);
        brandstList.assignAll(model.data ?? []);
      }
    } finally {
      isLoading.value = false;
    }
  }
}

*/
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Data/models/brands_model.dart';
import '../Data/services/api_checker.dart';
import '../Data/services/api_client.dart';
import '../Data/services/api_constant.dart';

class BrandController extends GetxController{

  var isbrandLoding = false.obs;

  RxList<BrandData> brandList = <BrandData>[].obs;


  Future<void> fetchBrand()async{

    isbrandLoding(true);

    final response = await ApiClient.getData(ApiConstant.brands);
    if(response.statusCode == 200){

      List<dynamic> data = response.body['data'];
      brandList.value = data.map((e) => BrandData.fromJson(e)).toList();
    }else{
      ApiChecker.checkApi(response);
    }
    isbrandLoding(false);


  }
}
