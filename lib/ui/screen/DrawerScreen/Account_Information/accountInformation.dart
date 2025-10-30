/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:laza_shopping/Controller/user_Profile_controller.dart';
import 'package:laza_shopping/Data/models/user_Profile.dart';
import 'package:laza_shopping/ui/widgets/CustomAuthWidgets/custom_Button.dart';
import 'package:laza_shopping/utils/appColor.dart';

class AccountInformation extends StatelessWidget {
   AccountInformation({super.key});
  final UserProfileController userProfileController = Get.put(UserProfileController());

  @override
  Widget build(BuildContext context) {
    userProfileController.userProfile;



    final List<Map<String, String>> accountInfo = [
      {'title': 'Name', 'text': 'Zakaria Rabby'},
      {'title': 'Email', 'text': 'ZakariaRabby@gmail.com'},
      {'title': 'Phone', 'text': '+880 1711-123456'},
      {'title': 'Country', 'text': ' Bangladesh'},
      {'title': 'City', 'text': ' Sylhet'},
      {'title': 'Address', 'text': ' Chhatak, Sunamgonj 12/8AB'},

    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Account Information',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Center(
                child:
               CircleAvatar(

                 backgroundImage: AssetImage('assets/card_image/card1.png'),
                  radius: 50,
               )
            ),
            Obx(()
    {
    if(userProfileController.isLoading.value){
    return const Center(child: CircularProgressIndicator());
    } if(userProfileController.userProfile.isEmpty){
    return const Center(child: Text('No info available'));

    }

    return  ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: userProfileController.userProfile.length,
      separatorBuilder: (context, index) => const SizedBox(height: 24),
      itemBuilder: (context, index) {
        final item = userProfileController.userProfile[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.data!.firstName.toString() ,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: AppColor.textColor.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              item.data!.email.toString(),
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        );
      },
    );
    }


            ),
            SizedBox(height: 20,),
        ElevatedButton(style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          side: BorderSide(width: 2, color: AppColor.primaryColors),
          backgroundColor: Color(0xffF6F2FF),
          minimumSize: const Size(355, 50),
          maximumSize: Size.infinite,
        ),
            onPressed:(){}, child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.edit),
                Text('Edit',),
              ],
            ))

          ],
        ),
      ),
    );
  }
}



*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laza_shopping/Controller/user_Profile_controller.dart';
import 'package:laza_shopping/Data/services/api_constant.dart';
import 'package:laza_shopping/routs/routs.dart';
import 'package:laza_shopping/utils/appColor.dart';

class AccountInformation extends StatelessWidget {
  AccountInformation({super.key});

  final UserProfileInformationController userProfileInformationController =
  Get.put(UserProfileInformationController());


  @override
  Widget build(BuildContext context) {
    // Fetch profile data when screen is built
    userProfileInformationController.fatchAccountInformation();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Account Information',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Obx(()=>
            userProfileInformationController.isProductLoading.value
                ? const Center(child: CircularProgressIndicator())
                : userProfileInformationController.userinformationList.isEmpty
                ? const Center(child: Text('No info available'))
                :

            SingleChildScrollView(
          child:
          Column(
            children: [
              // Information fields
             ListView.builder(
               itemCount:  userProfileInformationController.userinformationList.length,
                 itemBuilder: (context ,index){
                   final item = userProfileInformationController.userinformationList[index];
                   return  Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [

                       Center(
                         child: CircleAvatar(
                           backgroundImage: NetworkImage(
                             "${ApiConstant.baseUrl}${item.image}"
                           ),
                           radius: 50,
                         ),
                       ),
                       InfoWidgets(
                         title: "Name",
                         value: '${item.firstName ??""}',
                       ),
                       InfoWidgets(
                         title: "Email",
                         value: '${item.email ??""}'
                       ),
                       InfoWidgets(
                         title: "Phone",
                         value: '${item.phone ??""}'
                       ),
                       InfoWidgets(
                         title: "Country",
                         value: '${item.country ??""}'
                       ),
                       InfoWidgets(
                         title: "City",
                         value: '${item.city ??""} '
                       ),
                       InfoWidgets(
                         title: "Address",
                         value: '${item.address ??""}'
                       )

                     ],
                   );

                 },
               shrinkWrap: true,
               physics: NeverScrollableScrollPhysics(),

             ),

              const SizedBox(height: 20),

              // Edit button

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  side: BorderSide(width: 2, color: AppColor.primaryColors),
                  backgroundColor: const Color(0xffF6F2FF),
                  minimumSize: const Size(355, 50),
                ),
                onPressed: () {
                  if (userProfileInformationController.userinformationList.isNotEmpty) {
                    final item = userProfileInformationController.userinformationList.first;

                    Get.toNamed(
                      Routes.editaccount_Information,
                      arguments: {
                        'firstName': item.firstName,
                        'email': item.email,
                        'phone': item.phone,
                        'country': item.country,
                        'city': item.city,
                        'address': item.address,
                        'image': item.image,
                      },
                    );
                  } else {
                    Get.snackbar("Error", "No profile data found!");
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.edit, color: Colors.black),
                    SizedBox(width: 8),
                    Text('Edit', style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),

            ],
          ),
        )),
      ),
    );
  }


}

class InfoWidgets extends StatelessWidget {
  final String? title;
  final String? value;

  InfoWidgets({super.key,  this.title,  this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:CrossAxisAlignment.start ,
      children: [
        Text(
          title ?? "",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColor.textColor,
          ),
        ),
        Text(
          value ??"",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

