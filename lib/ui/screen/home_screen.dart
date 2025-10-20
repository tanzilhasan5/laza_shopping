import 'package:flutter/material.dart';
import 'package:laza_shopping/ui/widgets/CustomCard/customListOfCard.dart';
import 'package:laza_shopping/ui/widgets/CustomTapber/customTapber.dart';
import 'package:laza_shopping/ui/widgets/SerchBer/customSearchBer.dart';
import 'package:laza_shopping/utils/appColor.dart';

import '../widgets/CustomAppberWidget/customAppBer.dart';

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
              rightIcon: 'assets/icon/Bag.svg',
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
                Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Choose Brand',style: TextStyle(color: Colors.black,fontSize: 20,),),
                    InkWell(
                      onTap: (){},
                        child: Text('View All',style: TextStyle(color: AppColor.textColor,fontSize: 12,),)),
                ],),
                SizedBox(height: 15,),
                CustomTabBar(),
                SizedBox(height: 15,),
                Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Choose Brand',style: TextStyle(color: Colors.black,fontSize: 20,),),
                    InkWell(
                        onTap: (){},
                        child: Text('View All',style: TextStyle(color: AppColor.textColor,fontSize: 12,),)),
                  ],),
          
                SizedBox(height: 15,),
               SingleChildScrollView(
                 scrollDirection: Axis.vertical,
                   child: SizedBox(
                    child: Customlistofcard(),
                   ),
               )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
