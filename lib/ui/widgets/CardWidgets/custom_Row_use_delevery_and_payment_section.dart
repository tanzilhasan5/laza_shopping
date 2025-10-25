import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laza_shopping/routs/routs.dart';
import 'package:laza_shopping/utils/appColor.dart';
import '../CustomAuthWidgets/custom_Button.dart';

class CustomDeleveryAndPayment extends StatefulWidget {
  const CustomDeleveryAndPayment({super.key});

  @override
  State<CustomDeleveryAndPayment> createState() =>
      _CustomDeleveryAndPaymentState();
}

class _CustomDeleveryAndPaymentState extends State<CustomDeleveryAndPayment> {
  bool deliveryIsChecked = false;
  bool paymentIsChecked = false;
  String? deliveryError;
  String? paymentError;

  /// <<<<< Validation Functionality >>>>>
  bool _validateAndSubmit() {
    setState(() {
      deliveryError = deliveryIsChecked ? null : 'Select delivery address';
      paymentError = paymentIsChecked ? null : 'Select payment method';
    });

    // Return true if both are valid
    if (deliveryError == null && paymentError == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(' Checkout Success')),
      );
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///<<<<<<<<<<<< Delivery Address Section >>>>>>>>>>>>
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Delivery Address',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                ),
                InkWell(
                  onTap: (){
                    Get.toNamed(Routes.addressScreen);
                  },
                    child: const Icon(Icons.chevron_right)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/icon/map.png'),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffFF7043),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 20,
                      width: 20,
                      child: const Center(
                        child: Icon(Icons.location_on_outlined,
                            size: 15, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Chhatak, Sunamgonj 12/8AB',
                      style:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Sylhet',
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: AppColor.textColor),
                    ),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  height: 30,
                  width: 30,
                  child: Checkbox.adaptive(
                    shape: const CircleBorder(),
                    activeColor: AppColor.SwitchColor,
                    checkColor: Colors.white,
                    value: deliveryIsChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        deliveryIsChecked = value ?? false;
                        deliveryError = null;
                      });
                    },
                  ),
                ),
              ],
            ),
            if (deliveryError != null)
              Padding(
                padding: const EdgeInsets.only(left: 12.0, bottom: 5),
                child: Text(
                  deliveryError!,
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
          ],
        ),

        const SizedBox(height: 10),

        ///<<<<<<<<<<<< Payment Section >>>>>>>>>>>>
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Payment Method',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                ),
                InkWell(
                  onTap: (){
                    Get.toNamed(Routes.my_cart_Screen);
                  },
                    child: const Icon(Icons.chevron_right)),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child:
                        Image(image: AssetImage('assets/icon/visa.png')),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Visa Classic',
                      style:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Sylhet',
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: AppColor.textColor),
                    ),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  height: 30,
                  width: 30,
                  child: Checkbox.adaptive(
                    shape: const CircleBorder(),
                    activeColor: AppColor.SwitchColor,
                    checkColor: Colors.white,
                    value: paymentIsChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        paymentIsChecked = value ?? false;
                        paymentError = null;
                      });
                    },
                  ),
                ),
              ],
            ),
            if (paymentError != null)
              Padding(
                padding: const EdgeInsets.only(left: 12.0, bottom: 5),
                child: Text(
                  paymentError!,
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
          ],
        ),

        const SizedBox(height: 10),

        ///<<<<<<<<<<<< Order Info >>>>>>>>>>>>
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order Info',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Subtotal', style: TextStyle(color: AppColor.textColor)),
                const Text('\$110',
                    style: TextStyle(fontWeight: FontWeight.w600)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Shipping cost',
                    style: TextStyle(color: AppColor.textColor)),
                const Text('\$10',
                    style: TextStyle(fontWeight: FontWeight.w600)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total', style: TextStyle(color: AppColor.textColor)),
                const Text('\$120',
                    style: TextStyle(fontWeight: FontWeight.w600)),
              ],
            ),
          ],
        ),

        const SizedBox(height: 10),

        ///<<<<<<<<<<<< Checkout Button >>>>>>>>>>>>
        Center(
          child: CustomButton(
            title: 'Checkout',
            onpress: () {
              bool isValid = _validateAndSubmit();
              if (isValid) {

              }
            },
          ),
        ),

        const SizedBox(height: 10),
      ],
    );
  }
}
