import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/appColor.dart';
import '../../../Controller/cart_controller.dart';
class MyCartList extends StatelessWidget {

  const MyCartList({super.key});

  @override
  Widget build(BuildContext context) {
    final AddToCartController controller = Get.put(AddToCartController());
    return Obx(() {
      return ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: controller.cartItems.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = controller.cartItems[index];

          return Container(
            height: 125,
            width: 335,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffF5F6FA),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      item['image'],
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(width: 10),

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['title'] ??'',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          item['brand']??'',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '\$${item['price']??''} (-\$${item['tax']??''} Tax)',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: AppColor.textColor,
                          ),
                        ),

                        //
                        Row(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1, color: Colors.grey),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: InkWell(
                                    onTap:() => controller.increment(index) ,
                                    child: Center(
                                      child: Icon( Icons.keyboard_arrow_up_sharp, color: Colors.grey),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  '${item['quantity']}',
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.grey),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: InkWell(
                                    onTap: () => controller.decrement(index),
                                    child: Center(
                                      child: Icon(Icons.keyboard_arrow_down_sharp,
                                          color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 80),
                            Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: InkWell(
                                onTap: () {
                                  controller.removeItem(index);
                                },
                                child: Center(
                                  child: Icon(Icons.delete_outline,size: 18,
                                      color: Colors.grey),
                                ),
                              ),
                            ),


                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
