import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:hairfixxer_shopkeeper/Utilities/Responsive.dart';

import 'MyContainer.dart';
import 'my_text_widget.dart';

class TopBarWidget extends StatelessWidget {
  BuildContext context;
  String backButtonPath;
  String text;

  TopBarWidget(
      {Key? key,
      this.topBarColor = Colors.transparent,
      required this.context,
      required this.backButtonPath,
      required this.text,
      this.marginTop = 0,
      this.marginLeft = 0,
      this.marginRight = 0,
      this.marginBottom = 0})
      : super(key: key);
  dynamic topBarColor = Colors.transparent;
  double marginTop = 0;
  double marginLeft = 0;
  double marginRight = 0;
  double marginBottom = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: marginTop,
          left: marginLeft,
          right: marginRight,
          bottom: marginBottom),
      child: myContainer(
        context: context,
        width: 1.0,
        height: 0.07,
        color: topBarColor,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(
                    "assets/$backButtonPath",
                    scale: 4,
                  )),
            ),
            Expanded(
              flex: 9,
              child: InkWell(
                onTap: () {},
                child: myResponsiveText(
                    text: text,
                    align: TextAlign.center,
                    textColor: Colors.white,
                    weight: FontWeight.w700,
                    initialFontSize: 17),
              ),
            ),
            Expanded(flex: 1, child: Container()),
            // InkWell(
            //   onTap: (){
            //     Navigator.push(context,MaterialPageRoute(
            //       builder:(context) => BottomNavigatorBar(), ));
            //   },
            //   child:Image.asset("assets/$assets2",scale: s,),
            // )
          ],
        ),
      ),
    );
  }
}

Widget topBar(BuildContext context, String backButtonPath, String text,
    {topBarColor = Colors.transparent,
    double marginTop = 0,
    double marginLeft = 0,
    double marginRight = 0,
    double marginBottom = 0}) {
  return Padding(
    padding: EdgeInsets.only(
        top: marginTop,
        left: marginLeft,
        right: marginRight,
        bottom: marginBottom),
    child: myContainer(
      context: context,
      width: 1,
      height: 0.07,
      color: topBarColor,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(
                  "assets/images/$backButtonPath",
                  scale: 4,
                )),
          ),
          Expanded(
            flex: 9,
            child: InkWell(
              onTap: () {},
              child: myResponsiveText(
                  text: text,
                  align: TextAlign.center,
                  textColor: Colors.white,
                  weight: FontWeight.w700,
                  initialFontSize: 17),
            ),
          ),
          Expanded(flex: 1, child: Container()),
          // InkWell(
          //   onTap: (){
          //     Navigator.push(context,MaterialPageRoute(
          //       builder:(context) => BottomNavigatorBar(), ));
          //   },
          //   child:Image.asset("assets/$assets2",scale: s,),
          // )
        ],
      ),
    ),
  );
}
