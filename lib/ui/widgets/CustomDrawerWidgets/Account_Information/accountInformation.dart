import 'package:flutter/material.dart';
import 'package:laza_shopping/ui/widgets/CustomAuthWidgets/custom_Button.dart';
import 'package:laza_shopping/utils/appColor.dart';

class AccountInformation extends StatelessWidget {
  const AccountInformation({super.key});

  @override
  Widget build(BuildContext context) {
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
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: accountInfo.length,
              separatorBuilder: (context, index) => const SizedBox(height: 24),
              itemBuilder: (context, index) {
                final item = accountInfo[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title']!,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: AppColor.textColor.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      item['text']!,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 20,),
        ElevatedButton(style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          backgroundColor: AppColor.circleAvatersColor,
          minimumSize: const Size(355, 50),
          maximumSize: Size.infinite,
        ),
            onPressed:(){}, child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.edit),
                Text('title',),
              ],
            ))

          ],
        ),
      ),
    );
  }
}



