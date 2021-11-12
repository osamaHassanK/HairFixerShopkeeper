import 'package:flutter/material.dart';

Widget containerSk(BuildContext context,
    [double? h,double? w,Color? color,BorderRadius? bRadius,
      String? text,Widget? widget ]){
  return Container(
    height:h,
    width: w,
    child:widget,
    decoration: (
        BoxDecoration( color:color, borderRadius:bRadius,
        )
    ),
  );
}