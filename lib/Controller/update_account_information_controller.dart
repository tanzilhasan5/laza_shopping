import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../Data/helpers/prefs_helpers.dart';
import '../Data/services/api_checker.dart';
import '../Data/services/api_client.dart';
import '../Data/services/api_constant.dart';
import '../Data/utils/app_constants.dart';
import '../routs/routs.dart';

class UpdateuserProfileController extends GetxController{
  var isLoading = false.obs;

  /*updateUserProfile(
      String firstName,
      String lastName,
      String email,
      String phone,
      String country,
      String city,
      String address,
      File imageFile,
      ) async
  {
    isLoading(true);

    String? token = await PrefsHelper.getString(AppConstants.bearerToken);

    var headers = {
      'Content-Type': 'application/json',
   'Authorization': 'Bearer $token',
    };

    var body = {
      "first_name": firstName,
      "email": email,
      "phone": phone,
      "country": country,
      "city": city,
      "address": address,
    };
    List<MultipartBody> multipartList = [];

    if (imageFile != null) {
      multipartList.add(MultipartBody('image', imageFile));
    }

    print("=====> API Call: ${ApiConstant.updateuserProfile}");
    print("Header: $headers");
    print("=====> API Body: $body");

    var response = await ApiClient.putMultipartData(
      ApiConstant.updateuserProfile,
      body,
      headers: headers, multipartBody: multipartList,
    );

    print("==========> Response Post Method :------ : ${response.statusCode}");
    print("=====> API Response: [${response.statusCode}] ${ApiConstant.updateuserProfile}");
    print(response.body);

    if (response.statusCode == 200) {
      Get.snackbar("Update", "Complite");
      if (response.body is Map && response.body['access'] != null) {
        await PrefsHelper.setString(AppConstants.bearerToken, response.body['access']);
      }
      Get.offAllNamed(Routes.main_buttom_naver);
    } else {
      ApiChecker.checkApi(response);
    }

    isLoading(false);
  }*/

  Future<void> updateUserInfo({
    required String firstName,
    required String phone,
    required String country,
    required String city,
    required String address,
    required String email,
    File? imageFile, // optional image
  }) async
  {
    isLoading(true);

    try {
      final body = {
        "first_name": firstName,
        "phone": phone,
        "country": country,
        "city": city,
        "address": address,
        "email": email,
      };

      List<MultipartBody> multipartList = [];

      if (imageFile != null) {
        multipartList.add(MultipartBody('image', imageFile));
      }

      final response = await ApiClient.putMultipartData(
        ApiConstant.updateuserProfile,
        body,
        multipartBody: multipartList,
      );

      if (response.statusCode == 200) {
        Get.snackbar("Success", "Profile updated successfully!");
        await PrefsHelper.setString(AppConstants.bearerToken, response.body['access']);
        Get.toNamed(Routes.accountInformationScreen); // Update view data
      } else {
        ApiChecker.checkApi(response);
      }
    } catch (e) {
      print("Update Error: $e");
    } finally {
      isLoading(false);
    }
  }

  RxString imagePath=''.obs;
  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    final image= await picker.pickImage(source: ImageSource.gallery);

    if(image != null){
      imagePath.value= image.path.toString();
    }
  }



}