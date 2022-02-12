import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:hairfixxer_shopkeeper/auth/app_colors.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/MyContainer.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/my_text_widget.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/text_widget.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/sk_notification.dart';

Widget topTitle(
  BuildContext context,
  String text,
) {
  return Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),color: Color(0xffD6A600), ),
    width: double.infinity,
    height: 50,

    child: Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: textSk(
          context, text, TextAlign.center, Colors.white, FontWeight.w500, 22),
    ),
  );
}

Widget topIcon(BuildContext context, String assets1, String text, double s,
    Widget widget) {
  return myContainer(
    context: context,
    width: 1,
    height: 0.07,
    color: AppColor.APP_YELLOW_COLOR,

    child: Row(

      children: [
        Expanded(
          flex: 1,
          child: InkWell(
              onTap: () {
                Navigator.pop(
                    context, MaterialPageRoute(builder: (context) => widget));
              },
              child: Image.asset(
                "assets/$assets1",
                scale: 5,
                color: Colors.white,
              )),
        ),
        Expanded(
          flex: 8,
          child: InkWell(
            onTap: (){



            },
            child: myResponsiveText( text: text, align: TextAlign.center,textColor:  Colors.white,
                weight: FontWeight.w500,initialFontSize:  17),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container()
        ),
        // InkWell(
        //   onTap: (){
        //     Navigator.push(context,MaterialPageRoute(
        //       builder:(context) => BottomNavigatorBar(), ));
        //   },
        //   child:Image.asset("assets/$assets2",scale: s,),
        // )
      ],
    ),
  );
}

Widget topIcon2(
    BuildContext context, String assets1, String assets2, double s) {
  return Padding(
    padding: const EdgeInsets.all(6.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
            onTap: () {
              Navigator.pop(context, true);
            },
            child: Image.asset(
              "assets/$assets1",
              scale: 4,
            )),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Notifications(),
                ));
          },
          child: Image.asset(
            "assets/$assets2",
            scale: s,
          ),
        )
      ],
    ),
  );
}
