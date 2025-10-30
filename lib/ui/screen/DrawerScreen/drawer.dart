import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:laza_shopping/Data/helpers/prefs_helpers.dart';
import 'package:laza_shopping/Data/utils/app_constants.dart';
import 'package:laza_shopping/routs/routs.dart';
import 'package:laza_shopping/utils/appColor.dart';

import '../../../Controller/user_Profile_controller.dart';

class CustomDrawer extends StatefulWidget {
   CustomDrawer({super.key});

  final UserProfileInformationController userProfileInformationController =
  Get.put(UserProfileInformationController());

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
            const SizedBox(height: 20),

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
                Get.toNamed(Routes.accountInformationScreen);
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
                Get.toNamed(Routes.orderScreen);
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
                Get.toNamed(Routes.setting);
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
            /*  onTap: ()async{
                Get.defaultDialog(
                  title: "Logout",
                  middleText: "Are you sure you want to logout?",


                );


                await PrefsHelper.remove(AppConstants.bearerToken);
                Get.offAllNamed(Routes.login_Screen);
                setState(() => selectedIndex = 4);
              },*/
                onTap: () async {
                  Get.defaultDialog(
                    buttonColor: AppColor.primaryColors,

                    backgroundColor: Colors.grey,
                    title: "Logout",
                    middleText: "Are you sure you want to logout?",
                    textCancel: "Cancel",
                    textConfirm: "Logout",
                    confirmTextColor: Colors.white,
                    cancelTextColor: Colors.white,
                    onConfirm: () async {
                      await PrefsHelper.remove(AppConstants.bearerToken);
                      Get.offAllNamed(Routes.login_Screen);
                      setState(() => selectedIndex = 4);
                      Get.back(); // close the dialog
                    },
                    onCancel: () {
                      Get.back();
                    },
                  );
                }

            ),
          ],
        ),
      ),
    );
  }
}
