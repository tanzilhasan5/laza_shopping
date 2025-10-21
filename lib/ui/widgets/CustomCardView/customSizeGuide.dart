import 'package:flutter/cupertino.dart';

class Customsizeguide extends StatelessWidget {
  Customsizeguide({super.key, });


  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> sizesGuide = [
      {
        'title': 'S',
      },
      {
        'title': 'M',
      },
      {
        'title': 'L',
      },{
        'title': 'XL',
      }
      ,{
        'title': 'XXL',
      }
    ];
    return SizedBox(
      height: 70,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            final size = sizesGuide[index];
            return Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xffF5F6FA),
              ),
              child: Center(
                child: Text(
                  size['title']
                  ,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(width: 10),
          itemCount: sizesGuide.length),
    );

  }
}
