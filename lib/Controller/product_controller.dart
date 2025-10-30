/*
import 'dart:convert';
import 'package:get/get.dart';
import 'package:laza_shopping/Data/services/api_checker.dart';
import 'package:laza_shopping/Data/services/api_client.dart';
import 'package:laza_shopping/Data/services/api_constant.dart';
import '../Data/models/productModel.dart';


class ProductController extends GetxController{

  var isProductLoading = false.obs;

  RxList<Product> productList = <Product>[].obs;


  Future<void> fetchProductData()async{

    isProductLoading(true);

    final response = await ApiClient.getData(ApiConstant.shopingproducts);
    if(response.statusCode == 200){

      List<dynamic> data = response.body['data'];
      productList.value = data.map((e) => Product.fromJson(e)).toList();
    }else{
      ApiChecker.checkApi(response);
    }
    isProductLoading(false);


  }
}
*/

import 'dart:convert';
import 'package:get/get.dart';
import 'package:laza_shopping/Data/services/api_checker.dart';
import 'package:laza_shopping/Data/services/api_client.dart';
import 'package:laza_shopping/Data/services/api_constant.dart';
import '../Data/models/productModel.dart';

class ProductController extends GetxController {
  var isProductLoading = false.obs;

  ///<<<<< List of all products >>>>>>>>
  RxList<Product> allProducts = <Product>[].obs;

 ///<<<<< Product list to be displayed >>>>>>>>
  RxList<Product> productList = <Product>[].obs;

  ///<<<<< Fetch product data from API >>>>>>>>
  Future<void> fetchProductData() async {
    try {
      isProductLoading(true);

      final response = await ApiClient.getData(ApiConstant.shopingproducts);

      if (response.statusCode == 200) {
        List<dynamic> data = response.body['data'];
        allProducts.value = data.map((e) => Product.fromJson(e)).toList();
        ///<<<<<< Assign all products to product list >>>>>>>>
        productList.assignAll(allProducts);
      } else {
        ApiChecker.checkApi(response);
      }
    } finally {
      isProductLoading(false);
    }
  }

  ///<<<<< Filter products by brand >>>>>>>>
  void filterProductsByBrand(String brandName) {
    if (allProducts.isEmpty) return;

    final filtered = allProducts.where((product) {
      final brand = product.brand?.name?.toLowerCase() ?? '';
      return brand == brandName.toLowerCase();
    }).toList();

    productList.assignAll(filtered);
  }
}

