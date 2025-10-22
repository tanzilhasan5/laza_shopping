import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laza_shopping/utils/appColor.dart';

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
    {'name': 'Nike', 'icon': 'assets/brand_logo/Nike.svg'},
    {'name': 'Puma', 'icon': 'assets/brand_logo/Puma.svg'},
    {'name': 'Fila', 'icon': 'assets/brand_logo/Reebok.svg'},
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
        screen = const ReebokScreen();
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
                  ? AppColor.primaryColors
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

// -------------------- 4 DIFFERENT SCREENS --------------------
class AdidasScreen extends StatelessWidget {
  const AdidasScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Adidas")),
      body: const Center(child: Text("Welcome to Adidas Page")),
    );
  }
}

class NikeScreen extends StatelessWidget {
  const NikeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nike")),
      body: const Center(child: Text("Welcome to Nike Page")),
    );
  }
}

class PumaScreen extends StatelessWidget {
  const PumaScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Puma")),
      body: const Center(child: Text("Welcome to Puma Page")),
    );
  }
}

class ReebokScreen extends StatelessWidget {
  const ReebokScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Fila")),
      body: const Center(child: Text("Welcome to Reebok Page")),
    );
  }
}
