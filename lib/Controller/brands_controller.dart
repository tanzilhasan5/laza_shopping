
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
