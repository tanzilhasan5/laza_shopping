import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:laza_shopping/Controller/user_Profile_controller.dart';

import '../Data/helpers/prefs_helpers.dart';
import '../Data/services/api_checker.dart';
import '../Data/services/api_client.dart';
import '../Data/services/api_constant.dart';
import '../Data/utils/app_constants.dart';
import '../routs/routs.dart';

class UpdateuserProfileController extends GetxController{
  var isLoading = false.obs;

  final _accountInfoController = Get.put(UserProfileInformationController());

  Future<void> updateUserInfo({
    required String firstName,
    required String phone,
    required String country,
    required String city,
    required String address,
    File? imageFile,
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

        Get.snackbar(
          'Update', 'Complite',
          snackPosition: SnackPosition.BOTTOM,
        );

        print("success =================>");

         _accountInfoController.fatchAccountInformation();


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