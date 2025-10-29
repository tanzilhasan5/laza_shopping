import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:laza_shopping/Controller/update_account_information_controller.dart';
import 'package:laza_shopping/Controller/user_Profile_controller.dart';
import 'package:laza_shopping/ui/widgets/CustomAuthWidgets/customSwitch.dart';
import 'package:laza_shopping/ui/widgets/CustomAuthWidgets/custom_Button.dart';
import 'package:laza_shopping/ui/widgets/CustomAuthWidgets/custom_textfield.dart';
import 'package:laza_shopping/utils/appColor.dart';

class UpdateAccountInformation extends StatefulWidget {
  UpdateAccountInformation({super.key});

  @override
  State<UpdateAccountInformation> createState() =>
      _UpdateAccountInformationState();
}

class _UpdateAccountInformationState extends State<UpdateAccountInformation> {
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _fristnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _addressController = TextEditingController();
  final UpdateuserProfileController _updateuserProfileController = Get.put(UpdateuserProfileController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Account Information')),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child:
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(radius: 40),
                    Positioned(
                      left: 23,
                      top: 61,

                      child: Container(
                        height: 30,
                        width: 32,

                        decoration: BoxDecoration(
                          color: Color(0xff9775FA),
                          border: Border.all(width: 2, color: Colors.white),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.edit, size: 10),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 61),
              InputField(
                  title: 'Frist Name',
                  hintText: 'Zakaria Rabby',
                  controller: _fristnameController
              ),
              InputField(
                  title: 'Last Name',
                  hintText: 'Zakaria Rabby',
                  controller: _lastnameController
              ),
              SizedBox(height: 5),
              InputField(
                title: 'Email',
                controller: _emailController,

                hintText: 'name@example.com',
              ),
              SizedBox(height: 5),
              InputField(
                title: 'Phone',
                controller: _phoneController,

                hintText: 'Phone',
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                      width: MediaQuery.of(context).size.width/2.3,
                      child:
                      InputField(
                        title: 'Country',
                        controller: _countryController,
                      )),
                  SizedBox( width: 10,),
                  SizedBox(
                    height: 100,
                      width: MediaQuery.of(context).size.width/2.3,
                      child:
                      InputField(
                        title: 'City',
                        controller: _cityController,
                      )),

                ],
              ),
              SizedBox(height: 5),
              InputField(
                title: 'Address',
                controller: _addressController,

                hintText: 'Dhaka, Bangladesh',
              ),
              SizedBox(height: 20),
              Obx(()=>CustomButton(
                isLoading: _updateuserProfileController.isLoading.value,
                  title: 'Save Address',
                  onpress: () {
                    if (_formKey.currentState!.validate()) {
                      _updateuserProfileController.updateUserProfile(
                          _fristnameController.text,
                          _lastnameController.text,
                          _emailController.text,
                        _phoneController.text,
                        _countryController.text,
                          _cityController.text,
                          _addressController.text,



                      );

                    }
                  },
                ),
              ),
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
    _fristnameController.dispose();
    _lastnameController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}

class InputField extends StatelessWidget {
  const InputField({super.key, this.controller, this.hintText, this.title});

  final TextEditingController? controller;
  final String? hintText;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? "",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 17,
            height: 1.1,
            color: Color(0xff1D1E20),
          ),
        ),
        SizedBox(height: 10,),
        TextFormField(
          controller: controller,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15,
            height: 1.1,
            color: AppColor.textColor,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: AppColor.textColor),

            filled: true,
            fillColor: Color(0xFFF5F6FA),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your country';
            }
            return null;
          },
        ),
      ],
    );
  }
}
