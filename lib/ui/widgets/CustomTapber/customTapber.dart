/*
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laza_shopping/ui/screen/TapberScreen/filaScreen.dart';
import 'package:laza_shopping/utils/appColor.dart';

import '../../screen/TapberScreen/adidasScreen.dart';
import '../../screen/TapberScreen/nikeScreen.dart';
import '../../screen/TapberScreen/purmaScreen.dart';

// -------------------- MAIN TAB BAR --------------------
class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> tabs = [
    {'name': 'Adidas', 'icon': 'assets/brand_logo/Adidas.svg'},
    {'name': 'Nike', 'icon': 'assets/brand_logo/nike.svg'},
    {'name': 'Puma', 'icon': 'assets/brand_logo/Adidas.svg'},
    {'name': 'Fila', 'icon': 'assets/brand_logo/Adidas.svg'},
  ];

  // Function to handle tab navigation
  void navigateToTabScreen(BuildContext context, String name) {
    Widget screen;

    switch (name) {
      case 'Adidas':
        screen = const AdidasScreen();
        break;
      case 'Nike':
        screen = const NikeScreen();
        break;
      case 'Puma':
        screen = const PumaScreen();
        break;
      case 'Fila':
        screen = const FilaScreen();
        break;
      default:
        screen = const Scaffold(body: Center(child: Text("Unknown Tab")));
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

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
                  ? AppColor.textColor
                  : AppColor.circleAvatersColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              setState(() => selectedIndex = index);
              navigateToTabScreen(context, tab['name']);
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

*/
/*
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:laza_shopping/Controller/brands_controller.dart';
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

  final BrandsController brandsController = Get.put(BrandsController());

  // Navigate based on brand name
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
          body: Center(
            child: Text(name ?? "Unknown Brand"),
          ),
        );
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (brandsController.brandstList.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }

      return SizedBox(
        height: 50,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: brandsController.brandstList.length,
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemBuilder: (context, index) {

            final brand = brandsController.brandstList[index];
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
                navigateToTabScreen(context, brand.name);
              },
              child: Row(
                children: [
                  // Handle SVG or image automatically
                  brand.brandImage != null && brand.brandImage!.endsWith('.svg')
                      ? SvgPicture.network(
                    brand.brandImage!,
                    height: 25,
                  )
                      : Image.network(
                    brand.brandImage ?? '',
                    height: 25,
                    errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.image_not_supported, size: 25),
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
      );
    });
  }
}

*/

/*
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:laza_shopping/Controller/brands_controller.dart';
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
  final BrandsController brandsController = Get.put(BrandsController());

  final String baseUrl = 'https://e-bazar-latest.onrender.com/media/brand_images/Adidas.png';

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
    return Obx(() {
      if (brandsController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (brandsController.brandstList.isEmpty) {
        return const Center(child: Text("No brands available"));
      }

      return SizedBox(
        height: 50,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: brandsController.brandstList.length,
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemBuilder: (context, index) {
            final brand = brandsController.brandstList[index];
            final bool isSelected = index == selectedIndex;

            final imageUrl = brand.brandImage != null
                ? '$baseUrl${brand.brandImage}'
                : '';

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
                navigateToTabScreen(context, brand.name);
              },
              child: Row(
                children: [
                  imageUrl.endsWith('')
                      ? SvgPicture.network(imageUrl, height: 25)
                      : Image.network(
                    imageUrl,
                    height: 25,
                    errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.image_not_supported, size: 25),
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
      );
    });
  }
}

*/


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:laza_shopping/Controller/brands_controller.dart';
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
  final BrandsController brandsController = Get.put(BrandsController());

  final String baseUrl = 'https://e-bazar-latest.onrender.com';

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
    return Obx(() {
      if (brandsController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (brandsController.brandstList.isEmpty) {
        return const Center(child: Text("No brands available"));
      }

      return SizedBox(
        height: 50,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: brandsController.brandstList.length,
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemBuilder: (context, index) {
            final brand = brandsController.brandstList[index];
            final bool isSelected = index == selectedIndex;

            // Build full image URL safely
            final imageUrl = brand.brandImage != null
                ? '$baseUrl${brand.brandImage}'
                : '';

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
                navigateToTabScreen(context, brand.name);
              },
              child: Row(
                children: [
                  // Handle image or fallback
                  imageUrl.endsWith('.svg')
                      ? SvgPicture.network(imageUrl, height: 25)
                      : Image.network(
                    imageUrl,
                    height: 25,
                    errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.image_not_supported, size: 25),
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
      );
    });
  }
}

