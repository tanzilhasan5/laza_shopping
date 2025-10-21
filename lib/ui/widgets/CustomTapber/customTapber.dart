import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laza_shopping/utils/appColor.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> tabs = [
    {'name': 'Adidas', 'icon': 'assets/brand_logo/Adidas.svg'},
    {'name': 'Adidas', 'icon': 'assets/brand_logo/Adidas.svg'},
    {'name': 'Adidas', 'icon': 'assets/brand_logo/Adidas.svg'},
    {'name': 'Adidas', 'icon': 'assets/brand_logo/Adidas.svg'},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: tabs.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final tab = tabs[index];
          final bool isSelected = index == selectedIndex;

          return TextButton(
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
                SvgPicture.asset(
                  tab['icon'],
                  height: 25,
                ),
                const SizedBox(width: 8),
                Text(
                  tab['name'],
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight:
                    isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
