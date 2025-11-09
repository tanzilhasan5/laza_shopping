import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Controller/about_Controller.dart';




class AboutUs extends StatelessWidget {
  AboutUs({super.key});

  final AboutusController _controller = Get.put(AboutusController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'About Us',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Obx(() {
        if (_controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (_controller.aboutUsList.isEmpty) {
          return const Center(child: Text('No data found'));
        }

        return ListView.builder(
          itemCount: _controller.aboutUsList.length,
          itemBuilder: (context, index) {
            final item = _controller.aboutUsList[index];
            return Padding(
              padding: const EdgeInsets.all(12),
              child:  Column(
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