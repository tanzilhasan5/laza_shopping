import 'package:easy_stars/easy_stars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laza_shopping/utils/appColor.dart';

import '../../../routs/routs.dart';


class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String,dynamic>> ReviewList = [
      {
        'image':'assets/card_image/card4.png',
        'name':'Ronaldo Richards',
        'time':'13 Sep, 2020',
        'rating':'4.8',
        'description':'Lorem ipsum dolor sit amet, consectetur '
            'adipiscing elit. '
            'Pellentesque malesuada eget vitae amet...'
      },
      {
        'image':'assets/card_image/card4.png',
        'name':'Ronaldo Richards',
        'time':'13 Sep, 2020',
        'rating':'4.8',
        'description':'Lorem ipsum dolor sit amet, consectetur '
            'adipiscing elit. '
            'Pellentesque malesuada eget vitae amet...'
      },
      {
        'image':'assets/card_image/card4.png',
        'name':'Ronaldo Richards',
        'time':'13 Sep, 2020',
        'rating':'4.8',
        'description':'Lorem ipsum dolor sit amet, consectetur '
            'adipiscing elit. '
            'Pellentesque malesuada eget vitae amet...'
      },
      {
        'image':'assets/card_image/card4.png',
        'name':'Ronaldo Richards',
        'time':'13 Sep, 2020',
        'rating':'4.8',
        'description':'Lorem ipsum dolor sit amet, consectetur '
            'adipiscing elit. '
            'Pellentesque malesuada eget vitae amet...'
      },
      {
        'image':'assets/card_image/card4.png',
        'name':'Ronaldo Richards',
        'time':'13 Sep, 2020',
        'rating':'4.8',
        'description':'Lorem ipsum dolor sit amet, consectetur '
            'adipiscing elit. '
            'Pellentesque malesuada eget vitae amet...'
      },
      {
        'image':'assets/card_image/card4.png',
        'name':'Ronaldo Richards',
        'time':'13 Sep, 2020',
        'rating':'4.8',
        'description':'Lorem ipsum dolor sit amet, consectetur '
            'adipiscing elit. '
            'Pellentesque malesuada eget vitae amet...'
      },



    ];

    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white70,
        title: Text('Reviews',style: TextStyle(

          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),),
      ),
     body: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 20),
       child: ListView.separated
         (
           itemBuilder: (context,index){
             final reviewList = ReviewList[index];
             return Column(
               crossAxisAlignment: CrossAxisAlignment.start,
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
                         Get.toNamed(Routs.addreviewScreen);
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
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Row(
                       children: [
                         Container(
                           height: 50,
                           width: 50,

                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(50),
                             color: Colors.grey,
                             image: DecorationImage(

                               image: AssetImage(reviewList['image']),
                               fit: BoxFit.fill,),
                         ),),
                         SizedBox(width: 8,),
                         Column(
                           children: [
                             Text(
                               reviewList['name'],
                               style: TextStyle(
                                 fontSize: 15,
                                 fontWeight: FontWeight.w500,
                               ),
                             ),
                             Row(
                               children: [
                                 Icon(
                                   Icons.access_time_rounded,
                                   color: AppColor.textColor,
                                   size: 15,
                                 ),
                                 SizedBox(width: 8),
                                 Text(
                                   reviewList['time'],
                                   style: TextStyle(
                                     color: AppColor.textColor,
                                     fontSize: 15,
                                     fontWeight: FontWeight.w400,
                                   ),
                                 ),
                               ],
                             ),
                           ],
                         ),
                       ],
                     ),
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
                           starSize: 16,
                           allowHalfRating: true,
                           emptyColor: AppColor.textColor,

                           initialRating: 4.5,
                           readOnly: true,
                         )
                       ],
                     ),
                   ],
                 ),
                 SizedBox(height: 10,),
                 Text(reviewList['description'],style: TextStyle(
                   fontSize: 15,
                   fontWeight: FontWeight.w400,
                   color: AppColor.textColor,
                 ),)
               ],
             );
           },
           separatorBuilder: (  context, index) =>SizedBox(height: 10),
           itemCount: ReviewList.length),
     ),
    );

  }
}
