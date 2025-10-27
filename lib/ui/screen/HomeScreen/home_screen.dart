import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:laza_shopping/ui/widgets/CustomCard/customCard.dart';
import 'package:laza_shopping/ui/widgets/CustomTapber/customTapber.dart';
import 'package:laza_shopping/ui/widgets/SerchBer/customSearchBer.dart';
import 'package:laza_shopping/ui/widgets/custom_reuseable_ListTile.dart';
import 'package:laza_shopping/utils/appColor.dart';

import '../../../routs/routs.dart';
import '../../widgets/CustomAppberWidget/customAppBer.dart';
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


class HomeScreen extends StatefulWidget {

   HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        appBar:
        PreferredSize(
            preferredSize: Size(double.maxFinite, 100),
            child: Customappber(
              leftIconColor: AppColor.circleAvatersColor,
              rightIconColor: AppColor.circleAvatersColor,
              leftIcon: 'assets/icon/menu.svg',
              leftonTap: (){
                scaffoldKey.currentState!.openDrawer();
              },
              rightIcon: 'assets/icon/Bag.svg',
              rightonPress: (){
                Get.toNamed(Routes.cartScreen);
              },
            )),
        body:
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text('Hello',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
                   Text('Welcome to Laza.',style: TextStyle(fontSize: 15,color: AppColor.textColor),),
                 ],
               ),
                SizedBox(height: 10,),
                Custom_search_Ber(),
                SizedBox(height: 15,),
                CustomListTile(
                  lefttitle: 'Choose Brand',
                  righttitle: 'View All',
                  ontap: (){},
                ),
                SizedBox(height: 15,),
                ///<.....Chose Brand....>
                CustomTabBar(),
                SizedBox(height: 15,),
              /*  CustomListTile(
                  lefttitle: 'New Arraival',
                  righttitle: 'View All',
                  ontap: (){},
                ),*/
                SizedBox(height: 15,),
                ///<.....New Arraival....>
                CustomCard()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
