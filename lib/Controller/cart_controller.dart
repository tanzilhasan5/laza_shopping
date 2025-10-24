import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddToCartController extends GetxController {
  var cartItems = <Map<String, dynamic>>[
    {
      'image': 'assets/card_image/card1.png',
      'title': "Men's Tie-Dye T-Shirt Nike Sportswear",
      'price': 45.0,
      'tax': 4.0,
      'quantity': 1,
    },
    {
      'image': 'assets/card_image/card2.png',
      'title': "Men's Tie-Dye T-Shirt",
      'price': 45.0,
      'tax': 4.0,
      'quantity': 1,
    },
    {
      'image': 'assets/card_image/card1.png',
      'title': "Men's Cotton Hoodie Nike Sportswear",
      'price': 65.0,
      'tax': 5.0,
      'quantity': 1,
    },
    {
      'image': 'assets/card_image/card2.png',
      'brand': "Zara Nike Sportswear",
      'price': 90.0,
      'tax': 6.0,
      'quantity': 1,
    },
  ].obs;

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
          TextButton(onPressed: (){ cartItems.removeAt(index);Get.back();}, child: Text('Delete')),
          TextButton(onPressed: (){Get.back();}, child: Text('Cancel')),


        ]
    );
  }
}
