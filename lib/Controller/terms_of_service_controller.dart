
import 'package:get/get.dart';
import 'package:laza_shopping/Data/services/api_constant.dart';

import '../Data/models/termsofservices_model.dart';
import '../Data/services/api_checker.dart';
import '../Data/services/api_client.dart';

class TermsofServicesController extends GetxController {
  var isLoading = false.obs;
  var termsList = <TermsData>[].obs;

  Future<void> fetchTermsCondition() async {
    isLoading.value = true;

    final response = await ApiClient.getData(ApiConstant.terms_condition);

    if (response.statusCode == 200) {
      final termsCondition = TermsCondition.fromJson(response.body);
      termsList.value = termsCondition.data ?? [];
    } else {
      ApiChecker.checkApi(response);
    }

    isLoading.value = false;
  }

  @override
  void onInit() {
    fetchTermsCondition();
    super.onInit();
  }
}