
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/text_widget.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/bottomnavigatorbar.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/sk_notification.dart';

Widget topTitle(BuildContext context,String text,){
  return Container(
    width: double.infinity,
    height: 50,
    color: Color(0xffD6A600),
    child: Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: textSk(context,text,TextAlign.center,Colors.white,FontWeight.w500,22),
    ),
  );
}

Widget topIcon(BuildContext context,String assets1,String assets2,double s,Widget widget){
  return   Padding(
    padding: const EdgeInsets.all(6.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: (){
            Navigator.pop(context,MaterialPageRoute(builder:(context)=>widget));
          },
          child:Image.asset("assets/$assets1",scale: 4,)
        ),
        InkWell(
          onTap: (){
            Navigator.push(context,MaterialPageRoute(
              builder:(context) => BottomNavigatorBar(), ));
          },
          child:Image.asset("assets/$assets2",scale: s,),
        )
      ],
    ),
  );
}

Widget topIcon2(BuildContext context,String assets1,String assets2,double s){
  return   Padding(
    padding: const EdgeInsets.all(6.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
            onTap: (){
              Navigator.pop(context,true);
            },
            child:Image.asset("assets/$assets1",scale: 4,)
        ),
        InkWell(
          onTap: (){
            Navigator.push(context,MaterialPageRoute(
              builder:(context) => Notifications(), ));
          },
          child:Image.asset("assets/$assets2",scale: s,),
        )
      ],
    ),
  );
}
