import 'package:flutter/material.dart';
import 'package:laza_shopping/ui/screen/DrawerScreen/OrderScreen/to_recived.dart';
import 'package:laza_shopping/ui/widgets/CustomAuthWidgets/custom_Button.dart';

import 'complited.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text('Order',style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),),
          bottom: TabBar(

              tabs: [


            Tab(text: 'Completed',),
            Tab(text: 'To received',),
          ]),

        ),

        body: TabBarView(
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
              ListView.separated(

                itemCount: 10,
                itemBuilder: (context, index) {
                  return const CompliteOrder();
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 10,);
                },
              ),

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
              ListView.separated(

                itemCount: 10,
                itemBuilder: (context, index) {
                  return const ToRecivedOrder();
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 10,);
                },
              ),

            ),

          ],
        ),
      ),
    );
  }
}


