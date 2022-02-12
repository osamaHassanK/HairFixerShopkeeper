import 'package:flutter/material.dart';
import 'package:hairfixxer_shopkeeper/Utilities/Responsive.dart';

class ScreenBg extends StatelessWidget {
  const ScreenBg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Responsive.responsiveHeight(context),
      width: Responsive.responsiveWidth(context),
      child: Opacity(
          opacity: 0.3,
          child: Image.asset(
            'assets/home_screen_bg.png',
            fit: BoxFit.fill,
          )),
    );
  }
}
