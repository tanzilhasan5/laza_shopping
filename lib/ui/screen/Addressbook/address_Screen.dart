import 'package:flutter/material.dart';
import 'package:laza_shopping/ui/widgets/CustomAuthWidgets/customSwitch.dart';
import 'package:laza_shopping/ui/widgets/CustomAuthWidgets/custom_Button.dart';
import 'package:laza_shopping/ui/widgets/CustomAuthWidgets/custom_textfield.dart';

class AddressScreen extends StatelessWidget {
   AddressScreen({super.key});
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Address'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Country',style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),),
                      SizedBox(height: 10,),

                      SizedBox(
                        width: 150,height: 50,
                        child: Center(
                          child: CustomTextField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your country';
                              }
                              return null;
                            },
                            controller: _countryController,
                            hintText: 'Bangladesh',
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('City',
                        style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      ),
                      SizedBox(height: 10,),

                      SizedBox(
                        width: 150,height: 50,
                        child:Center(
                          child: CustomTextField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your country';
                              }
                              return null;
                            },
                            hintText: 'Sylhet',
                            controller: _cityController,
                          ),
                        )
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text('Phone Number',style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),),
                  SizedBox(height: 10),
                  CustomTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your country';
                      }
                      return null;
                    },
                    controller: _phoneController,

                    hintText: '+880 1453-987533',

                  ),
                ],
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Address',style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),),
                  SizedBox(height: 10),
                  CustomTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your country';
                      }
                      return null;
                    },
                    controller: _addressController,

                    hintText: 'Chhatak, Sunamgonj 12/8AB',

                  ),
                ],
              ),

              CustomSwitch(
                title: 'Save as primary address',
                initialValue: true,
                onChanged: (val) {},
              ),
              CustomButton(

                title: 'Save Address',
                onpress: (){
                  if (_formKey.currentState!.validate()) {}
                },
              )

            ],
          ),
        ),
      ),
    );
  }
  void dispose() {
    _countryController.dispose();
    _cityController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
  }

}
