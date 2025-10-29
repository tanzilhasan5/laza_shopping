import 'package:get/get.dart';
import 'package:laza_shopping/Data/services/api_checker.dart';
import 'package:laza_shopping/Data/services/api_client.dart';
import 'package:laza_shopping/Data/services/api_constant.dart';

import '../Data/models/privacy_policy_model.dart';

class PrivacypolicyController extends GetxController {
  var isLoading = false.obs;
  var policyList = <PrivacyData>[].obs;

  Future<void> fetchPrivacyPolicy() async {
    isLoading.value = true;

    final response = await ApiClient.getData(ApiConstant.privacypolicy);

    if (response.statusCode == 200) {
      final privacyPolicy = PrivacyPolicyModel.fromJson(response.body);
      policyList.value = privacyPolicy.data ?? [];
    } else {
      ApiChecker.checkApi(response);
    }

    isLoading.value = false;
  }

  @override
  void onInit() {
    fetchPrivacyPolicy();
    super.onInit();
  }
}