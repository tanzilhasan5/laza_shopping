import 'package:flutter/material.dart';

class GallerySection extends StatelessWidget {
  final List<String> galleryImages = [
    'assets/galary/galary1.png',
    'assets/galary/galary2.png',
    'assets/galary/galary3.png',
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
              return Padding(
                padding: EdgeInsets.only(right: index == galleryImages.length - 1 ? 0 : 8),
                child: GalleryImage(imagePath: galleryImages[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}

class GalleryImage extends StatelessWidget {
  final String imagePath;

  const GalleryImage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}