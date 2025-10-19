import 'package:flutter/cupertino.dart';

class Customsizeguide extends StatelessWidget {
  Customsizeguide({super.key, this.text});

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0xffF5F6FA),
      ),
      child: Center(
        child: Text(
          text.toString(),
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
