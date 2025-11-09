import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:laza_shopping/routs/routs.dart';
import 'package:laza_shopping/utils/appColor.dart';

import 'Controller/product_controller.dart';
import 'Controller/review_controller.dart';
import 'Controller/wishlistController.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ReviewController());
    Get.lazyPut(() => ProductController());
    Get.lazyPut(() => WishlistController());
    return ScreenUtilInit(
      designSize: Size(375, 812),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.spalish_Screen,
        getPages: pages,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: AppColor.primaryColors
        ),
      ),
    );
  }
}
