import 'package:flutter/material.dart';
import 'package:hairfixxer_shopkeeper/auth/app_colors.dart';

Widget myButton(
    {required String buttonText,
    double widht = 0,
    double height = 0,
    textColor,
    double textFontSize=0,
     textFontWeight,
    Function()? onTap,
    double cornerRadius = 0}) {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: textColor,

    primary: AppColor.APP_YELLOW_COLOR,
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: widht, vertical: height),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
    ),
  );
  return ElevatedButton(

    style: raisedButtonStyle,
    onPressed: onTap,
    child: Text(
      buttonText,
      style: TextStyle(fontWeight: textFontWeight, fontSize: textFontSize),
    ),
  );
}
