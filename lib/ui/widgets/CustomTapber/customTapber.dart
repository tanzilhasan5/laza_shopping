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

  final List<String> tabs = ['Adidas', 'Nike', 'File', 'Pruma'];
  final List<String> image = [
    'assets/brand_logo/Adidas.svg',
    'assets/brand_logo/fila-9 1.svg',
    'assets/brand_logo/Adidas.svg',
    'assets/brand_logo/Adidas.svg',

  ];

  @override
  Widget build(BuildContext context) {
    return Row(
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
               SvgPicture.asset(image[index],color: isSelected ? Colors.black : Colors.black,),
                SizedBox(width: 10,),
                Text(
                  tabs[index],
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
  }
}
