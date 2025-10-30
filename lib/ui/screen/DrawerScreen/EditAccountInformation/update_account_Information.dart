
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laza_shopping/Controller/update_account_information_controller.dart';
import 'package:laza_shopping/ui/widgets/CustomAuthWidgets/custom_Button.dart';
import 'package:laza_shopping/utils/appColor.dart';
import 'package:laza_shopping/Data/services/api_constant.dart';

class UpdateAccountInformation extends StatefulWidget {
  const UpdateAccountInformation({super.key});

  @override
  State<UpdateAccountInformation> createState() =>
      _UpdateAccountInformationState();
}

class _UpdateAccountInformationState extends State<UpdateAccountInformation> {
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _fristnameController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final UpdateuserProfileController _updateuserProfileController =
  Get.put(UpdateuserProfileController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final data = Get.arguments;

    if (data != null) {
      _fristnameController.text = data['firstName'] ?? '';
      _phoneController.text = data['phone'] ?? '';
      _countryController.text = data['country'] ?? '';
      _cityController.text = data['city'] ?? '';
      _addressController.text = data['address'] ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Account Information')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Obx(() {
            return Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: Get.arguments != null &&
                            Get.arguments['image'] != null
                            ? NetworkImage(
                            "${ApiConstant.baseUrl}${Get.arguments['image']}")
                            : null,
                        backgroundColor: Colors.grey[300],
                      ),
                      Positioned(
                        left: 23,
                        top: 61,
                        child: InkWell(
                          onTap: () {
                            _updateuserProfileController.getImage();
                          },
                          child: Container(
                            height: 30,
                            width: 32,
                            decoration: BoxDecoration(
                              color: const Color(0xff9775FA),
                              border: Border.all(width: 2, color: Colors.white),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.edit, size: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 61),
                InputField(
                  title: 'First Name',
                  controller: _fristnameController,
                ),
                InputField(
                  title: 'Phone',
                  controller: _phoneController,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 100,
                      width: MediaQuery.of(context).size.width / 2.3,
                      child: InputField(
                        title: 'Country',
                        controller: _countryController,
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      height: 100,
                      width: MediaQuery.of(context).size.width / 2.3,
                      child: InputField(
                        title: 'City',
                        controller: _cityController,
                      ),
                    ),
                  ],
                ),
                InputField(
                  title: 'Address',
                  controller: _addressController,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  isLoading: _updateuserProfileController.isLoading.value,
                  title: 'Save Address',
                  onpress: () {
                    if (_formKey.currentState!.validate()) {
                      _updateuserProfileController.updateUserInfo(
                        firstName: _fristnameController.text,
                        phone: _phoneController.text,
                        country: _countryController.text,
                        city: _cityController.text,
                        address: _addressController.text,
                        imageFile:
                        _updateuserProfileController.imagePath.value.isNotEmpty
                            ? File(_updateuserProfileController.imagePath.value)
                            : null,
                      );
                    }
                  },
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _countryController.dispose();
    _cityController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _fristnameController.dispose();
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
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 17,
            height: 1.1,
            color: Color(0xff1D1E20),
          ),
        ),
        const SizedBox(height: 10),
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
            fillColor: const Color(0xFFF5F6FA),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'This field cannot be empty';
            }
            return null;
          },
        ),
      ],
    );
  }
}
