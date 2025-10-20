import 'package:flutter/material.dart';

class GallerySection extends StatelessWidget {
  final List<String> galleryImages = [
    'assets/galary/galary1.png',
    'assets/galary/galary2.png',
    'assets/galary/galary3.png',
    'assets/galary/galary4.png',
    'assets/galary/galary4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: galleryImages.length,
            itemBuilder: (context, index) {
              final imagePath = galleryImages[index];
              return Padding(
                padding: EdgeInsets.only(right: index == galleryImages.length - 1 ? 0 : 8),
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              );
            },
          ),
        ),
      ],
    );
  }
}
