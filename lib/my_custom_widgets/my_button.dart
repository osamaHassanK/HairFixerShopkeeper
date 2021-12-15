import 'package:flutter/material.dart';
import 'package:hairfixxer_shopkeeper/auth/app_colors.dart';

Widget myButton(
    {required String buttonText,
    double widht = 0,
    double height = 0,
    Function()? onTap,
    double cornerRadius = 0}) {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
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
    child: Text(buttonText),
  );
}
