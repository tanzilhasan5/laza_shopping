import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:laza_shopping/routs/routs.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int selectedIndex = -1; // track selected tile

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                child: SvgPicture.asset('assets/icon/menu.svg'),
              ),
            ),
            ListTile(
              title: const Text('Person Name'),
              leading: CircleAvatar(
                child: SvgPicture.asset('assets/brand_logo/Adidas.svg'),
              ),
            ),
            const SizedBox(height: 10),

            // 🔹 Each ListTile directly defined
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              tileColor: selectedIndex == 0
                  ? Colors.grey.shade200
                  : Colors.transparent,
              leading: Icon(
                Icons.info_outline,
                color: selectedIndex == 0 ? Colors.blue : Colors.black,
              ),
              title: Text(
                "Account Information",
                style: TextStyle(
                  color: selectedIndex == 0 ? Colors.blue : Colors.black,
                  fontWeight: selectedIndex == 0
                      ? FontWeight.w600
                      : FontWeight.normal,
                ),
              ),
              onTap: () {
                setState(() => selectedIndex = 0);
              },
            ),

            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              tileColor: selectedIndex == 1
                  ? Colors.grey.shade200
                  : Colors.transparent,
              leading: SvgPicture.asset(
                'assets/icon/Bag.svg',
                colorFilter: ColorFilter.mode(
                  selectedIndex == 1 ? Colors.blue : Colors.black,
                  BlendMode.srcIn,
                ),
              ),
              title: Text(
                "Order",
                style: TextStyle(
                  color: selectedIndex == 1 ? Colors.blue : Colors.black,
                  fontWeight: selectedIndex == 1
                      ? FontWeight.w600
                      : FontWeight.normal,
                ),
              ),
              onTap: () {
                setState(() => selectedIndex = 1);
              },
            ),

            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              tileColor: selectedIndex == 2
                  ? Colors.grey.shade200
                  : Colors.transparent,
              leading: Icon(
                Icons.account_balance_wallet_outlined,
                color: selectedIndex == 2 ? Colors.blue : Colors.black,
              ),
              title: Text(
                "MyCart",
                style: TextStyle(
                  color: selectedIndex == 2 ? Colors.blue : Colors.black,
                  fontWeight: selectedIndex == 2
                      ? FontWeight.w600
                      : FontWeight.normal,
                ),
              ),
              onTap: () {
                setState(() => selectedIndex = 2);
                Get.toNamed(Routs.mycartScreen);
              },
            ),

            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              tileColor: selectedIndex == 3
                  ? Colors.grey.shade200
                  : Colors.transparent,
              leading: Icon(
                Icons.settings,
                color: selectedIndex == 3 ? Colors.blue : Colors.black,
              ),
              title: Text(
                "Settings",
                style: TextStyle(
                  color: selectedIndex == 3 ? Colors.blue : Colors.black,
                  fontWeight: selectedIndex == 3
                      ? FontWeight.w600
                      : FontWeight.normal,
                ),
              ),
              onTap: () {
                setState(() => selectedIndex = 3);
              },
            ),

            const Spacer(),

            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              tileColor: selectedIndex == 4
                  ? Colors.grey.shade200
                  : Colors.transparent,
              leading: Icon(
                Icons.logout,
                color: selectedIndex == 4 ? Colors.blue : Colors.red,
              ),
              title: Text(
                "Logout",
                style: TextStyle(
                  color: selectedIndex == 4 ? Colors.blue : Colors.red,
                  fontWeight: selectedIndex == 4
                      ? FontWeight.w600
                      : FontWeight.normal,
                ),
              ),
              onTap: () {
                setState(() => selectedIndex = 4);
              },
            ),
          ],
        ),
      ),
    );
  }
}
