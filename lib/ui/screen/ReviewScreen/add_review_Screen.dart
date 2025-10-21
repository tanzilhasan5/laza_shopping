import 'package:flutter/material.dart';
import 'package:laza_shopping/ui/widgets/CustomAuthWidgets/custom_textfield.dart';
import 'package:laza_shopping/ui/widgets/Custom_Reviews/slidder_review.dart';

import '../../widgets/CustomAuthWidgets/custom_Button.dart';

class AddReviewScreen extends StatelessWidget {
  const AddReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _reviewController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 10,),
                CustomTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  controller: _nameController,
                  hintText: 'Type your name',
                ),
                SizedBox(height: 10,),
                Text(
                  'How was your experience ?',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 10,),
                CustomTextField(
          
                  maxline: 6,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  controller: _reviewController,
                  hintText: 'Describe your experience?',
                ),
                SizedBox(height: 10,),
                StarRatingSlider(),
          
          
              ],
            ),
          ),
        ),
      ),
    );
  }
}
