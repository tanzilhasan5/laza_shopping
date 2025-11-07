import 'package:flutter/material.dart';
import '../../widgets/CartWidgets/cart_widgets.dart';
import '../../widgets/CartWidgets/custom_Row_use_delevery_and_payment_section.dart';
class CartScreen extends StatelessWidget {
  CartScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(' Cart'),
        backgroundColor: Colors.transparent,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
        ///<<<<<<MycartList>>>>>
            MyCartList(),
            CustomDeleveryAndPayment(),
          ]
      ))

    );
  }
}