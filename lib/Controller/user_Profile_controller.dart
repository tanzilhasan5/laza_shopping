/*
import 'dart:convert';
import 'package:get/get.dart';
import 'package:laza_shopping/Data/models/user_Profile.dart';
import 'package:laza_shopping/Data/services/api_checker.dart';
import 'package:laza_shopping/Data/services/api_client.dart';
import 'package:laza_shopping/Data/services/api_constant.dart';
class UserProfileController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<UserProfile> userProfile = <UserProfile>[].obs;

  Future<void> getUserProfile() async {
    try {
      isLoading.value = true;
      final headers = {
        'Content-Type': 'application/json',
      };
      final response = await ApiClient.getData(
        ApiConstant.userProfile,
        headers: headers,
      );
      if (response.statusCode == 200) {
        final decoded = response.body is String
            ? jsonDecode(response.body)
            : response.body;
        final userProfileRessponse = UserProfile.fromJson(decoded);
        userProfile.value = userProfileRessponse.data as List<UserProfile>;
        print('✅ Products fetched successfully: ${userProfile.length}');
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
}*/
/*
import 'dart:convert';
import 'package:get/get.dart';
import 'package:laza_shopping/Data/models/user_Profile.dart';
import 'package:laza_shopping/Data/services/api_checker.dart';
import 'package:laza_shopping/Data/services/api_client.dart';
import 'package:laza_shopping/Data/services/api_constant.dart';

import '../Data/helpers/prefs_helpers.dart';
import '../Data/utils/app_constants.dart';

class UserProfileController extends GetxController {
  @override

  RxBool isLoading = false.obs;
  Rx<UserData?> userProfile = Rx<UserData?>(null);

  Future<void> getUserProfile() async {
    try {
      isLoading.value = true;

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AppConstants.bearerToken}',
      };


      final response = await ApiClient.getData(
        ApiConstant.userProfile,
        headers: headers,
      );

      if (response.statusCode == 200) {
        await PrefsHelper.setString(
          AppConstants.Token,
          response.body['access'],
        );
        final decoded = response.body is String
            ? jsonDecode(response.body)
            : response.body;

        final userProfileResponse = UserProfile.fromJson(decoded);
        userProfile.value = userProfileResponse.data;

        print('✅ User profile fetched successfully: ${userProfile.value?.firstName}');
      } else {
        ApiChecker.checkApi(response);
        print('❌ Failed to fetch user profile: ${response.statusText}');
      }
    } catch (e) {
      print('⚠️ Error fetching user profile: $e');
    } finally {
      isLoading.value = false;
    }
  }
}

*/
import 'package:get/get.dart';
import 'package:laza_shopping/Data/models/user_Profile.dart';
import 'package:laza_shopping/Data/services/api_checker.dart';
import 'package:laza_shopping/Data/services/api_client.dart';
import 'package:laza_shopping/Data/services/api_constant.dart';


class UserProfileInformationController extends GetxController{

  var isProductLoading = false.obs;

  RxList<UserData> userinformationList = <UserData>[].obs;


 /* Future<void> fatchAccountInformation()async{

    isProductLoading(true);

    final response = await ApiClient.getData(ApiConstant.userProfile);
    if(response.statusCode == 200){

      List<dynamic> data = response.body['data'];
      userinformationList.value = data.map((e) => UserData.fromJson(e)).toList();
    }else{
      ApiChecker.checkApi(response);
    }
    isProductLoading(false);


  }*/

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



