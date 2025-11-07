
import 'package:get/get.dart';
import 'package:laza_shopping/Data/models/productModel.dart';
import 'package:flutter/material.dart';

class AddToCartController extends GetxController {
  var cartItems = <Map<String, dynamic>>[].obs;

  void addToCart(Product product) {
    int index = cartItems.indexWhere((item) => item['id'] == product.id);

    if (index != -1) {
      cartItems[index]['quantity']++;
    } else {
      cartItems.add({
        'id': product.id,
        'image': product.images?.isNotEmpty == true ? product.images!.first : '',
        'title': product.name ?? 'Unknown Product',
        'price': product.price ?? 0.0,
        'quantity': 1,
      });
    }
    cartItems.refresh();
  }

  void increment(int index) {
    cartItems[index]['quantity']++;
    cartItems.refresh();
  }

  void decrement(int index) {
    if (cartItems[index]['quantity'] > 1) {
      cartItems[index]['quantity']--;
      cartItems.refresh();
    }
  }

  void removeItem(int index) {
    Get.defaultDialog(
      title: "Remove Item",
      middleText: "Are you sure you want to remove this item?",
      actions: [
        TextButton(
          onPressed: () {
            cartItems.removeAt(index);
            Get.back();
          },
          child: const Text('Delete'),
        ),
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}


