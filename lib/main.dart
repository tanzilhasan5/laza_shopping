import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laza_shopping/routs/routs.dart';
import 'package:laza_shopping/utils/appColor.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routs.spalish_Screen,
      getPages: pages,
      theme: ThemeData(
        primaryColor: AppColor.primaryColors
      ),
    );
  }
}
