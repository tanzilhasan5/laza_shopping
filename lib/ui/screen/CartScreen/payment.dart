import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laza_shopping/Controller/payment_Controller.dart';
import 'package:laza_shopping/ui/widgets/CustomAuthWidgets/custom_Button.dart';
import 'package:laza_shopping/ui/widgets/CustomAuthWidgets/solide_textField.dart';

import '../../../utils/appColor.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    final PaymentController paymentController =Get.put(PaymentController());
    final TextEditingController _name = TextEditingController();
    final TextEditingController _email = TextEditingController();
    final TextEditingController _phone = TextEditingController();
    final TextEditingController _address = TextEditingController();
    final GlobalKey<FormState> _fromKey =GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('Payment'),
      ),

      body: Form(
        key: _fromKey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(height: 80,),
              SolidTextField(
                controller: _name,
                hintText: 'Enter Your Name',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15,),
              SolidTextField(
                controller: _email,
                hintText: 'Enter Your Email',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15,),
              SolidTextField(
                controller: _phone,
                hintText: 'Enter Your Phone',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Phone';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15,),
              SolidTextField(
                controller: _address,
                hintText: 'Enter Your Address',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 90,),
              Obx((){
                 return paymentController.isLoading.value
                    ? const CircularProgressIndicator():CustomButton(
                  title: "Chack out for Payment",
                  onpress: (){
                    if(_fromKey.currentState!.validate()){
                      paymentController.fatchPayment(
                          _name.text, _email.text, _phone.text, _address.text
                      );


                    }

                  },
                );
              }
              )

            ],
          ),
        ),
      ),
    );
  }

}
