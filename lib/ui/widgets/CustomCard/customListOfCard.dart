import 'package:flutter/cupertino.dart';
import 'package:laza_shopping/ui/widgets/CustomCard/customCard.dart';

class Customlistofcard extends StatelessWidget {
  const Customlistofcard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCard(
          imagePath: 'assets/card_image/card1.png',
          title: 'Nike Sportswear Club Fleece',
          price: '99',
          downtext: 'Fleece',
          secondimagePath: 'assets/card_image/card2.png',
          secondtitle: 'Trail Running Jacket Nike',
          seconddowntext: 'Windrunner',
          secondprice: '99',
        ),
        SizedBox(height: 15,),
        CustomCard(
          imagePath: 'assets/card_image/card3.png',
          title: 'Nike Sportswear Club Fleece',
          price: '99',
          downtext: 'Fleece',
          secondimagePath: 'assets/card_image/card4.png',
          secondtitle: 'Trail Running Jacket Nike',
          seconddowntext: 'Windrunner',
          secondprice: '99',
        ),
        SizedBox(height: 15,),
        CustomCard(
          imagePath: 'assets/card_image/card1.png',
          title: 'Nike Sportswear Club Fleece',
          price: '99',
          downtext: 'Fleece',
          secondimagePath: 'assets/card_image/card2.png',
          secondtitle: 'Trail Running Jacket Nike',
          seconddowntext: 'Windrunner',
          secondprice: '99',
        ),
        SizedBox(height: 15,),
        CustomCard(
          imagePath: 'assets/card_image/card3.png',
          title: 'Nike Sportswear Club Fleece',
          price: '99',
          downtext: 'Fleece',
          secondimagePath: 'assets/card_image/card4.png',
          secondtitle: 'Trail Running Jacket Nike',
          seconddowntext: 'Windrunner',
          secondprice: '99',
        ),
      ],
    );
  }
}
