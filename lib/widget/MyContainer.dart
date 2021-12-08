import 'package:flutter/material.dart';
import 'package:hairfixxer_shopkeeper/responsive/Responsive.dart';

Widget myContainer({required BuildContext context,

      Widget? child,
      double height = 1.0,
    double width = 1.0,
    Color? color,
    double radiusValue=0.0 ,
    }) {
  return Container(
    height: Responsive.responsiveHeight(context,value: height) ,
    width:  Responsive.responsiveHeight(context,value: width),
    child: child,
    decoration: (BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(radiusValue)),
    )),
  );
}
