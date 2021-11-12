import 'package:flutter/material.dart';

Widget textSk(BuildContext context,[String? text,TextAlign? align,Color? color,
  FontWeight? weight,double? size
]){
  return Text(
    text!,textAlign: align,
    style: TextStyle(color:color,fontWeight: weight,fontSize: size,),
  );
}