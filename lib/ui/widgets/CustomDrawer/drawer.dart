import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:laza_shopping/routs/routs.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ListTile( leading: CircleAvatar(child: SvgPicture.asset('assets/icon/menu.svg')),),
            ListTile(  title: Text('Person Name'),
              leading: CircleAvatar(child: SvgPicture.asset('assets/brand_logo/Adidas.svg')),),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text("Account Information"),
              onTap: () {
                //
              },
            ),
            ListTile(
              leading:  SvgPicture.asset('assets/icon/Bag.svg'),
              title: const Text("Order"),
              onTap: () {
                //
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_balance_wallet_outlined),
              title: const Text("MyCard"),
              onTap: () {
                Get.toNamed(Routs.mycartScreen);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () {
              },
            ),
            Spacer(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}
