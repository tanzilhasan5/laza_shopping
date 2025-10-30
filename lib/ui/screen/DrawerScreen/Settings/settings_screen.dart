import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:laza_shopping/utils/appColor.dart';

import '../../../../routs/routs.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Setting"),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [
            SizedBox(height: 20,),

            InkWell(
              onTap: (){
                Get.toNamed(Routes.termsOfService);
              },
              child: Row(
                children: [
                Icon(Icons.info_outline,color: AppColor.primaryColors ),
                  SizedBox(width: 10,),
                  Text("Terms Of Services")
                ],
              ),
            ),

            SizedBox(height: 20,),

            InkWell(
              onTap: (){
                Get.toNamed(Routes.privacypolicy);
              },
              child: Row(
                children: [
                  Icon(Icons.privacy_tip_outlined,color: AppColor.primaryColors ),
                  SizedBox(width: 10,),
                  Text("Privacy Policy")
                ],
              ),
            ),

            SizedBox(height: 20,),

            InkWell(
              onTap: (){
                Get.toNamed(Routes.about_us);
              },
              child: Row(
                children: [
                  Icon(Icons.privacy_tip_sharp,color: AppColor.primaryColors ),
                  SizedBox(width: 10,),
                  Text("About Us")
                ],
              ),
            ),
          ],
        )
    );
  }
}