import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laza_shopping/ui/widgets/MyCardWidgets/custom_Row_use_delevery_and_payment_section.dart';
import 'package:laza_shopping/ui/widgets/MyCardWidgets/my_cart_widgets.dart';
import 'package:laza_shopping/utils/appColor.dart';
import '../controller/my_cart_controller.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Cart'),
        backgroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
        ///<<<<<<MycartList>>>>>
            MyCartList(),
            CustomRow()
          ]
      ))

    );
  }
}