
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:laza_shopping/ui/widgets/CustomAuthWidgets/customSwitch.dart';
import 'package:laza_shopping/ui/widgets/CustomAuthWidgets/custom_Button.dart';
import 'package:laza_shopping/utils/appColor.dart';


class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  String cardHolderName = '';
  String cardNumber = '';
  String expiryDate = '';

  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final OutlineInputBorder border = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey.withOpacity(0.7),
      width: 2.0,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Cart', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children:[
          CreditCardWidget(
            backgroundImage: 'assets/image/Mask Group.png',
            cardHolderName: cardHolderName,
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cvvCode: cvvCode,
            bankName: 'Visa',
            showBackView: isCvvFocused,
            obscureCardNumber: true,
            obscureCardCvv: true,
            isHolderNameVisible: true,
            cardBgColor: Colors.pink,
            onCreditCardWidgetChange:
                (CreditCardBrand creditCardBrand) {},
          ),

          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: TextButton(
                style: TextButton.styleFrom(
                  side: BorderSide(width: 2,color:AppColor.primaryColors),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  backgroundColor: AppColor.circleAvatersColor
                ),
                  onPressed: (){}, child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add),
                  Text('Add New Cards')
                ],
              )),
            ),
          ),
           SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              physics:  const NeverScrollableScrollPhysics(),
              child: Column(
                children:[
                  CreditCardForm(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    formKey: formKey,
                    cardHolderName: cardHolderName,
                    obscureCvv: true,
                    obscureNumber: true,
                    cardNumber: cardNumber,
                    cvvCode: cvvCode,
                    isHolderNameVisible: true,
                    isCardNumberVisible: true,
                    isExpiryDateVisible: true,

                    expiryDate: expiryDate,
                    inputConfiguration: const InputConfiguration(
                      cardHolderDecoration: InputDecoration(
                        labelText: 'Card Holder Name',
                      ),
                      cardNumberDecoration: InputDecoration(
                        labelText: 'Number',
                        hintText: 'XXXX XXXX XXXX XXXX',
                      ),
                      expiryDateDecoration: InputDecoration(
                        labelText: 'Expired Date',
                        hintText: 'XX/XX',
                      ),
                      cvvCodeDecoration: InputDecoration(
                        labelText: 'CVV',
                        hintText: 'XXX',
                      ),

                    ),
                    onCreditCardModelChange: onCreditCardModelChange,
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomSwitch(
                      title: 'Save Card info',
                      initialValue: true,
                      onChanged: (val) {},
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    onpress: (){
                      _onValidate();
                    },
                    title: 'Save Card',
                  ),
                  const SizedBox(height: 20),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  void _onValidate() {
    if (formKey.currentState?.validate() ?? false) {
      print('valid!');
      setState(() {

      });
    } else {
      print('invalid!');
    }
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardHolderName = creditCardModel.cardHolderName;
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;

      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}


