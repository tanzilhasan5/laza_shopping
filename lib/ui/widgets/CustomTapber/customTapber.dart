import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:laza_shopping/Controller/brands_controller.dart';
import 'package:laza_shopping/Data/services/api_constant.dart';
import 'package:laza_shopping/ui/screen/TapberScreen/adidasScreen.dart';
import 'package:laza_shopping/ui/screen/TapberScreen/nikeScreen.dart';
import 'package:laza_shopping/ui/screen/TapberScreen/purmaScreen.dart';
import 'package:laza_shopping/ui/screen/TapberScreen/filaScreen.dart';
import 'package:laza_shopping/utils/appColor.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int selectedIndex = 0;
  final  brandsController = Get.put(BrandController());
  @override
  void initState() {
    brandsController.fetchBrand();
    // TODO: implement initState
    super.initState();
  }


  void navigateToTabScreen(BuildContext context, String? name) {
    Widget screen;

    switch (name?.toLowerCase()) {
      case 'adidas':
        screen = const AdidasScreen();
        break;
      case 'nike':
        screen = const NikeScreen();
        break;
      case 'puma':
        screen = const PumaScreen();
        break;
      case 'fila':
        screen = const FilaScreen();
        break;
      default:
        screen = Scaffold(
          body: Center(child: Text(name ?? "Unknown Brand")),
        );
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(()=>SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: brandsController.brandList.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final brand = brandsController.brandList[index];
          final bool isSelected = index == selectedIndex;


          return
            TextButton(
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
              navigateToTabScreen(context, brand.name);
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
    ) );
  }
}


