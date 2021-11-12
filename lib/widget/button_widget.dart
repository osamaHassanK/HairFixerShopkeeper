import 'package:flutter/material.dart';

Widget buttonSk(BuildContext context,double h,double w,String mainText,
    double fSize,Color color,double elevation,BorderRadius radius, ){
  return SizedBox(
    height: h,
    width: w,
    child: ElevatedButton( onPressed: (){},
      child:Text(mainText!= null ? mainText:"hello",style: TextStyle(fontSize:fSize),),style: ElevatedButton.styleFrom(
          primary: color,
          elevation: elevation,
          shape: RoundedRectangleBorder(borderRadius: radius)
      ),),);}
