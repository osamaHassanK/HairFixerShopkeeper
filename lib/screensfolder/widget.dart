import 'package:flutter/material.dart';


class WidgetsSk{
   Widget containerSk(BuildContext context,
       [dynamic h,dynamic w,Color? color,BorderRadius? bRadius,
         String? text,Widget? widget ]){
     return Container(
       height:MediaQuery.of(context).size.height*h,
       width: MediaQuery.of(context).size.width*w,
       child:widget,
       decoration: (
           BoxDecoration( color:color, borderRadius:bRadius,
       )
       ),
     );
   }

   Widget textSk(BuildContext context,[String? text,TextAlign? align,Color? color,
   FontWeight? weight,double? size
   ]){
     return Text(
       text!,textAlign: align,
       style: TextStyle(color:color,fontWeight: weight,fontSize: size,),
     );
   }


 }