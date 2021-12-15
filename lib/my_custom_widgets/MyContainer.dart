import 'package:flutter/material.dart';
import 'package:hairfixxer_shopkeeper/Utilities/Responsive.dart';

Widget myContainer({
  required BuildContext context,
  Widget? child,
  double height = 1.0,
  double width = 1.0,
  Color? color,
  double radiusValue = 0.0,
  double marginLeft = 0.0,
  double marginRight = 0.0,
  double marginTop = 0.0,
  double marginBottom = 0.0,
}) {
  return Padding(
    padding: EdgeInsets.only(
        top: marginTop,
        bottom: marginBottom,
        left: marginLeft,
        right: marginRight),
    child: Container(
      height: Responsive.responsiveHeight(context, value: height),
      width: Responsive.responsiveWidth(context, value: width),
      child: child,
      decoration: (BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(radiusValue)),
      )),
    ),
  );
}
Widget myUnResponsiveContainer({
  required BuildContext context,
  Widget? child,
  double height = 1.0,
  double width = 1.0,
  Color? color,
  double radiusValue = 0.0,
  double marginLeft = 0.0,
  double marginRight = 0.0,
  double marginTop = 0.0,
  double marginBottom = 0.0,
}) {
  return Padding(
    padding: EdgeInsets.only(
        top: marginTop,
        bottom: marginBottom,
        left: marginLeft,
        right: marginRight),
    child: Container(
      height: height,
      width: width,
      child: child,
      decoration: (BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(radiusValue)),
      )),
    ),
  );
}
