import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Controller/terms_of_service_controller.dart';

class TermsOfServicePage extends StatelessWidget {
  TermsOfServicePage({super.key});

  final TermsofServicesController _termsofServicecontroller = Get.put(
    TermsofServicesController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Terms & Conditions',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (_termsofServicecontroller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (_termsofServicecontroller.termsList.isEmpty) {
          return const Center(child: Text('No terms found'));
        }

        return ListView.builder(
          itemCount: _termsofServicecontroller.termsList.length,
          itemBuilder: (context, index) {
            final item = _termsofServicecontroller.termsList[index];
            return Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.heading ?? 'No Title',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.description ?? 'No description available.',
                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
