import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laza_shopping/utils/appColor.dart';
class Custom_search_Ber extends StatelessWidget {
  const Custom_search_Ber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 50,
             width: 260,
              child:
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search,size: 30,color: Colors.grey,),
                    focusColor: AppColor.circleAvatersColor,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: AppColor.backgroundTextfield, width:2),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.95),
                    borderSide: BorderSide(color:AppColor.backgroundTextfield, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: AppColor.backgroundTextfield,  // Border color when not focused
                      width: 2,          // Border width when not focused
                    ),),

                ),
              ),
            ),
            SizedBox(width:8,),
            InkWell( onTap: (){},
              child: Padding(
                padding: const EdgeInsets.only(right: 2),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration:
                  BoxDecoration(
                      color: Color(0xff9775FA),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: SvgPicture.asset('assets/icon/Voice.svg'),
                ),
              ),
            ),
          ],
        ),
      );
  }
}