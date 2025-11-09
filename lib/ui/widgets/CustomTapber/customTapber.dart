import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:laza_shopping/Controller/brands_controller.dart';
import 'package:laza_shopping/Data/services/api_constant.dart';
import 'package:laza_shopping/ui/screen/TapberScreen/brand_screen.dart';
import 'package:laza_shopping/utils/appColor.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int selectedIndex = 0;
  final brandsController = Get.put(BrandController());
  @override
  void initState() {
    brandsController.fetchBrand();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
      height: 50.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: brandsController.brandList.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final brand = brandsController.brandList[index];
          final bool isSelected = index == selectedIndex;

          return TextButton(
            style: TextButton.styleFrom(
              backgroundColor: isSelected
                  ? AppColor.textColor
                  : AppColor.circleAvatersColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              setState(() => selectedIndex = index);
              if (brand.name != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BrandScreen(brandName: brand.name!)),
                );
              }
            },
            child: Row(
              children: [
                Image.network(
                  "${ApiConstant.baseUrl}${brand.brandImage}",
                  height: 25,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/brand_logo/noImage.jpg',
                      height: 25,
                    );
                  },
                ),
                const SizedBox(width: 8),
                Text(
                  brand.name ?? '',
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
    ));
  }
}
