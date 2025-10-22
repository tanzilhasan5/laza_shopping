import 'package:flutter/material.dart';
import 'package:laza_shopping/utils/appColor.dart';

class CustomRow extends StatefulWidget {
  const CustomRow({super.key});

  @override
  State<CustomRow> createState() => _CustomRowState();
}

class _CustomRowState extends State<CustomRow> {
  static bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Delivery Address',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
            ),
            Icon(Icons.chevron_right),

          ],
        ),
       Row(
         children: [
           Container(
             height: 50,
             width: 50,
             decoration: BoxDecoration(
                 color: Colors.grey,
                 image: DecorationImage(
                   fit: BoxFit.cover,
                   image: AssetImage('assets/images/delivery.png'),),
                 borderRadius: BorderRadius.circular(10)
             ),
             child: Center(
               child: Container(
                 decoration: BoxDecoration(
                     color: Color(0xffFF7043),
                     borderRadius: BorderRadius.circular(10)
                 ),
                 height: 25,
                 width: 25,
                 child:Center(
                   child: Icon(Icons.location_on_outlined,size: 15,color: Colors.white),
                 ),
               ),
             ),
           ),
          SizedBox(width: 10,),
           Column(
            children: [
              Text('dfdfdsfd',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
              Text('dfdfdsfd',style: TextStyle(fontSize: 11,fontWeight: FontWeight.w400,color: AppColor.textColor),),
            ],
          ),
           Spacer(),
           Checkbox.adaptive(

             shape: CircleBorder(),
               activeColor: AppColor.SwitchColor,
               checkColor: Colors.white,
               value: isCheck, onChanged: (bool? value){
             setState(() {
               isCheck = value ?? false;

             });
           })

         ],
       )
      ],
    );
  }
}
