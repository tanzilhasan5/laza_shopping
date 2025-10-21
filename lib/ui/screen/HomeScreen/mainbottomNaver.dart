import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laza_shopping/ui/screen/HomeScreen/home_screen.dart';
import 'package:laza_shopping/ui/widgets/CustomCard/CardViewScreen.dart';

class MainButtomNavber extends StatefulWidget {
  const MainButtomNavber({super.key});

  @override
  State<MainButtomNavber> createState() => _MainButtomNavberState();
}

class _MainButtomNavberState extends State<MainButtomNavber> {
  final List<Widget> _screen = [
    HomeScreen(),
  ];
  int _slectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_slectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _slectedIndex,
        onDestinationSelected: (int index) {
          _slectedIndex = index;
          setState(() {});
        },
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'home'),
          NavigationDestination(
            icon: Icon(Icons.favorite_outline_sharp),
            label: 'WishList',
          ),
          NavigationDestination(
            icon: SvgPicture.asset('assets/icon/Bag.svg'),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
