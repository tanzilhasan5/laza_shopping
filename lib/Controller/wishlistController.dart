import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController {
  var wishlist = <Map<String, String>>[].obs;

  bool isInWishlist(String title) {
    return wishlist.any((item) => item['title'] == title);
  }

  void toggleWishlist(Map<String, String> item) {
    if (isInWishlist(item['title']!)) {
      Get.defaultDialog(
          title: "Remove Item",
          middleText: "Are you sure you want to remove this item?",
          actions: [
            TextButton(onPressed: (){ wishlist.removeWhere((element) => element['title'] == item['title']);;Get.back();}, child: Text('Remove')),
            TextButton(onPressed: (){Get.back();}, child: Text('Cancel')),


          ]
      );
    } else {
      wishlist.add(item);
    }
  }
}
