import 'package:get/get.dart';

import '../Data/models/about_model.dart';
import '../Data/services/api_checker.dart';
import '../Data/services/api_client.dart';
import '../Data/services/api_constant.dart';

class AboutusController extends GetxController {
  var isLoading = false.obs;
  var aboutUsList = <AboutData>[].obs;

  Future<void> fetchAboutUs() async {
    isLoading.value = true;

    final response = await ApiClient.getData(ApiConstant.about_us);

    if (response.statusCode == 200) {
      final aboutUs = AboutUsModel.fromJson(response.body);
      aboutUsList.value = aboutUs.data ?? [];
    } else {
      ApiChecker.checkApi(response);
    }

    isLoading.value = false;
  }

  @override
  void onInit() {
    fetchAboutUs();
    super.onInit();
  }
}