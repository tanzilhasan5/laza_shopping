
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:laza_shopping/ui/widgets/custom_Button.dart';
import 'package:laza_shopping/utils/appColor.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../routs/routs.dart';
import '../widgets/custom_ReachText.dart';


class Pin_verification extends StatefulWidget {
  const Pin_verification({super.key});

  @override
  State<Pin_verification> createState() => _Pin_verificationState();
}

class _Pin_verificationState extends State<Pin_verification> {
  final TextEditingController _otpTEController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final String value = "Test";

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 105),
                Center(
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                  ),
                ),
                SizedBox(height: 68),
                SvgPicture.asset('assets/image/loginobject.svg'),
                SizedBox(height: 60),
                _buildPinCodeTextField(),
                SizedBox(height: 80,),
                Center(
                 child: RichText(text: TextSpan(
                   text: '00:20 ',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),
                   children:[
                     TextSpan(
                       text: ' resend confirmation code.',style: TextStyle(color: AppColor.textColor)
                     )
                   ]
                 )),
                ),
                const SizedBox(height: 24),
                CustomButton(
                  onpress: (){
                    if (_formKey.currentState!.validate()) {

                     Get.toNamed(Routs.NewPasswordSetScreen);

                    }
                  },
                  title: 'Confirm Code',
                ),
              ],
            ),
          ),
        ),

    );
  }

  Widget _buildPinCodeTextField() {
    return PinCodeTextField(
      length: 4,
      animationType: AnimationType.fade,
      keyboardType: TextInputType.number,
      pinTheme: PinTheme(
        fieldOuterPadding:EdgeInsetsGeometry.symmetric(horizontal:5 ) ,
        inactiveColor: Colors.grey,
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(10),
        fieldHeight: 88,
        fieldWidth: 70,
        activeFillColor: Colors.white,
        selectedFillColor: Colors.white,
        inactiveFillColor: Colors.white,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      validator: (val) {
        if (val!.isEmpty) {
          return 'Enter your Pincode';
        }
        return null;
      },
      onChanged: (val) {
        setState(() {
          val = value;
        });
      },
      controller: _otpTEController,
      appContext: context,
    );
  }

  @override
  void dispose() {
    _otpTEController.dispose();
    super.dispose();
  }
}
