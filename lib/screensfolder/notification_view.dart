import 'package:flutter/material.dart';
import 'package:hairfixxer_shopkeeper/base.dart';
import 'package:hairfixxer_shopkeeper/widget/container_widget.dart';
import 'package:hairfixxer_shopkeeper/widget/text_widget.dart';
import 'package:hairfixxer_shopkeeper/widget/top_icon&title.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  _NotificationViewState createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          topIcon(context,"backarrow.png","home.png"),
          topTitle(context, "Notification"),
          Padding(padding:EdgeInsets.only(top: 8,left: 8,right: 8),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              textSk(context,"2/12/12",TextAlign.right,Color(0xff767676),FontWeight.normal,15)
            ],
          ),),
          CircleAvatar(
            radius:50,
          child:imageSk("assets/men.png",1, BoxFit.cover),),
          Padding(padding: EdgeInsets.only(top: 8,right: 8,left: 8,bottom: 8),
            child:Row(
              children: [
                Container(height: 30,width: 110,color: Colors.red,),
                Column(
                  children: [
                    textSk(context,"Zaryab Ansari",TextAlign.center,Color(0xffC59909),
                        FontWeight.normal,21),
                    textSk(context,"View Profile",TextAlign.center,
                        Color(0xff767676),FontWeight.normal,13),

                  ],
                ),
                SizedBox(
                  width: 25,
                ),
                Column(
                  children: [
                    imageSk("assets/msg icon.png",1,BoxFit.none),
                    SizedBox(height: 8.0,),
                    textSk(context,"Mark as Read",TextAlign.center,
                    Color(0xff76767676),FontWeight.normal,10)
                  ],
                ),
              ],
            ),
          ),
         containerSk(context,)


        ],
      ),
    );
  }
}
