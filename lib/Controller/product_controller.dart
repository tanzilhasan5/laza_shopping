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
