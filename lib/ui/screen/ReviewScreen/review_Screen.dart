import 'package:easy_stars/easy_stars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:laza_shopping/ui/widgets/Review/listof_review.dart';

import '../../../routs/routs.dart';
import '../../../utils/appColor.dart' show AppColor;

class ReviewScreen extends StatelessWidget {
  final int? productId;
  const ReviewScreen({super.key, this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white70,
        title: Text('Reviews',style: TextStyle(

          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),),
      ),
      body: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
                Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text('245 Reviews',style: TextStyle(
                             fontSize: 17,
                             fontWeight: FontWeight.w600,
                           ),),
                           Row(children: [
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Row(
                                   children: [
                                     Text(
                                       '4.8',
                                       style: TextStyle(
                                         fontSize: 15,
                                         fontWeight: FontWeight.w500,
                                       ),
                                     ),
                                     SizedBox(width: 8),
                                     Text(
                                       'rating',
                                       style: TextStyle(
                                         fontSize: 15,
                                         fontWeight: FontWeight.w400,
                                         color: AppColor.textColor,
                                       ),
                                     ),
                                   ],
                                 ),
                                 EasyStarsDisplay(
                                   starSize: 16 ,
                                   allowHalfRating: true,
                                   emptyColor: AppColor.textColor,
          
                                   initialRating: 4.5,
                                   readOnly: true,
                                 )
                               ],
                             ),
                           ],),
                         ],
                       ),
                       InkWell(
                         onTap: (){
                           Get.toNamed(Routes.addreviewScreen);
                         },
                         child: Container(
                           height: 35,
                           width: 114,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(6),
                             color: Colors.deepOrange
                           ),
                           child: Row(
                             children: [
                             ImageIcon(AssetImage('assets/icon/Edit Square.png'),size: 30,color: Colors.white,),
                             Text('Add Review',style: TextStyle(
                               fontSize: 13,
                               fontWeight: FontWeight.w500,
                               color: Colors.white
                             ),)
                           ],),
                         ),
                       )
                     ],
                   ),
              SizedBox(height: 15,),
              ListOfReview(productId:productId.toString(),),

              SizedBox(height: 50,),
          
            ],
          ),
        ),
      ),
    );
  }
}
