
import 'package:get/get.dart';
import 'package:laza_shopping/Data/models/user_Profile.dart';
import 'package:laza_shopping/Data/services/api_checker.dart';
import 'package:laza_shopping/Data/services/api_client.dart';
import 'package:laza_shopping/Data/services/api_constant.dart';


class UserProfileInformationController extends GetxController{



  var isProductLoading = false.obs;

  RxList<UserData> userinformationList = <UserData>[].obs;


  Future<void> fatchAccountInformation() async {
    isProductLoading(true);

    final response = await ApiClient.getData(ApiConstant.userProfile);

    if (response.statusCode == 200) {

      final data = response.body['data'];

      userinformationList.clear();
      userinformationList.add(UserData.fromJson(data));
    } else {
      ApiChecker.checkApi(response);
    }

    isProductLoading(false);
  }

}



