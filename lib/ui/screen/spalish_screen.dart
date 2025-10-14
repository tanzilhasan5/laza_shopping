import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laza_shopping/routs/routs.dart';
import 'package:laza_shopping/utils/appColor.dart';

class SpalishScreen extends StatefulWidget {
  const SpalishScreen({super.key});

  @override
  State<SpalishScreen> createState() => _SpalishScreenState();
}

class _SpalishScreenState extends State<SpalishScreen> {
  @override
  void initState() {
   _moveToNextScreena();
    super.initState();
  }
  Future<void>_moveToNextScreena()async{
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, Routs.login_Screen);
    });

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColors,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Center(child: SvgPicture.asset('assets/image/Logo.svg',))
        ],
      ),
    );
  }
}
