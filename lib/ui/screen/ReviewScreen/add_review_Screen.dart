import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laza_shopping/Controller/review_controller.dart';
import 'package:laza_shopping/ui/widgets/CustomAuthWidgets/custom_textfield.dart';
import 'package:laza_shopping/ui/widgets/Custom_Reviews/slidder_review.dart';
import 'package:laza_shopping/utils/appColor.dart';

import '../../widgets/CustomAuthWidgets/custom_Button.dart';

class AddReviewScreen extends StatelessWidget {
  const AddReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _idController = TextEditingController();
    final TextEditingController _reatingController = TextEditingController();
    final TextEditingController _driscriptionController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    final ReviewController addReviewController = Get.put(
        ReviewController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Review',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Product ID',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 10),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Id';
                    }
                    return null;
                  },
                  controller: _idController,

                  decoration: InputDecoration(
                      hintText: 'Type your Product Id',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: AppColor.textColor,
                        ),
                      ),

                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: AppColor.textColor,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: 2
                          )
                      )
                  ),
                ),
                Text(
                  'Product Rating',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 10),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your rating';
                    }
                    return null;
                  },
                  controller: _reatingController,

                  decoration: InputDecoration(
                      hintText: 'Type your Product rating',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: AppColor.textColor,
                        ),
                      ),

                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: AppColor.textColor,
                        ),
                      ),
                      enabled: true,
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: 2
                          )
                      )
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'How was your experience ?',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 10),

                TextFormField(
                  maxLines: 5,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  controller: _driscriptionController,

                  decoration: InputDecoration(
                      hintText: 'Describe your experience?',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: AppColor.textColor,
                        ),
                      ),

                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: AppColor.textColor,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: 2
                          )
                      )
                  ),
                ),
                SizedBox(height: 10),
                StarRatingSlider(),
                SizedBox(height: 210),
                Obx(() =>
                    CustomButton(
                        title: 'Submit Review',
                        isLoading: addReviewController.isLoading.value,
                        onpress: () {
                          if (_formKey.currentState!.validate()) {
                            addReviewController.add_review(
                                int.tryParse(_idController.text.trim()) ?? 0, // Parse ID safely
                                int.tryParse(_reatingController.text.trim()) ?? 0,
                                _driscriptionController.text.trim(),

                            );

                          }
                        }
                    ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
