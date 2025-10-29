import 'package:flutter/material.dart';

import '../../../widgets/CustomAuthWidgets/custom_Button.dart';

class CompliteOrder extends StatelessWidget {
  const CompliteOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: Container(

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Color(0xffF5F6FA),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Padding(
              padding: const EdgeInsets.only(left: 12,bottom: 10),
              child: Container(
                  width: 80,
                  height: 80,
                  child: Image(image: NetworkImage('url'))
              ),
            ),
            const SizedBox(width: 12.0),


            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    const Text(
                      overflow: TextOverflow.clip,
                      "Men's Tie-Dye T-Shirt Nike Sportswear",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    // Column Child 2: Price

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "\$35.00",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          'Qty: 1',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    SizedBox(
                      height: 30,
                      width: 120,
                      child:
                      CustomButton(
                        title: 'Buy Again',
                        onpress: (){},
                      ),
                    )



                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}