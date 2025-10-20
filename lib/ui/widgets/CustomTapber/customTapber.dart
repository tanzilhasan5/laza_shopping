import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laza_shopping/utils/appColor.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int selectedIndex = 0; // track which tab is selected
  final List<Map<String, dynamic>> tabs = [
    {
      'name': 'Adidas',
      'icon': 'assets/brand_logo/Adidas.svg',
    },
    {
      'name': 'Nike',
      'icon': 'assets/brand_logo/Adidas.svg',
    },
    {
      'name': 'File',
      'icon': 'assets/brand_logo/fila-9 1.svg',
    },
    {
      'name': 'Pruma',
      'icon': 'assets/brand_logo/Adidas.svg',
    }

  ];



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
            final Tabs=tabs[index];
            return  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(tabs.length, (index) {
                final isSelected = index == selectedIndex;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: TextButton(

                    style: TextButton.styleFrom(
                      backgroundColor: isSelected
                          ? AppColor.primaryColors
                          : AppColor.circleAvatersColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(Tabs['icon']),
                        SizedBox(width: 10,),
                        Text(
                          Tabs['name'.toString()],
                          style: TextStyle(
                            color: isSelected ? Colors.black87 : Colors.black87,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            );

          },
          separatorBuilder: (context, index) => SizedBox(height: 10) ,
          itemCount: tabs.length
      ),
    );

  }
}
