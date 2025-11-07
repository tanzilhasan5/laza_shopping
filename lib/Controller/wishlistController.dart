import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController {
  var wishlist = <Map<String, String>>[].obs;

  bool isInWishlist(String id) {
    return wishlist.any((item) => item['id'] == id);
  }

  void toggleWishlist(Map<String, String> item) {
    if (isInWishlist(item['id']!)) {
      wishlist.removeWhere((element) => element['id'] == item['id']);
    } else {
      wishlist.add(item);
    }
  }
}
