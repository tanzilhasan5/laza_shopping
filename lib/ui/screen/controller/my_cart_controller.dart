import 'package:get/get.dart';

class AddToCartController extends GetxController {
  var cartItems = <Map<String, dynamic>>[
    {
      'image': 'assets/images/shirt.png',
      'title': "Men's Tie-Dye T-Shirt",
      'brand': "Nike Sportswear",
      'price': 45.0,
      'tax': 4.0,
      'quantity': 1,
    },
    {
      'image': 'assets/images/shirt2.png',
      'title': "Men's Cotton Hoodie",
      'brand': "Nike Sportswear",
      'price': 65.0,
      'tax': 5.0,
      'quantity': 1,
    },
    {
      'image': 'assets/images/jacket.png',
      'title': "Men's Casual Jacket",
      'brand': "Zara",
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
    cartItems.removeAt(index);
  }
}
