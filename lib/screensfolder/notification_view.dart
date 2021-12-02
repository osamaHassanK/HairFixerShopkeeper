import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hairfixxer_shopkeeper/base.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/sk_notification.dart';
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
    return SafeArea(child:Scaffold(
      body: SingleChildScrollView(
        child:Column(
          children: [
            topIcon(context,"backarrow.png","home.png",4,Notifications()),
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
            Padding(
              padding: EdgeInsets.only(top: 8,right: 8,left: 8,bottom: 8),
              child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        imageSk("assets/msg icon.png",1,BoxFit.none),
                        SizedBox(height: 8.0,),
                        textSk(context,"Mark as Read",TextAlign.center,
                            Color(0xff76767676),FontWeight.normal,9)
                      ],
                    ),
                  ]),
            ),
            Center(
              child: textSk(context,"Zaryab Ansari has just requested to book an\n"
                  " appopintment! Select the time slot to\n"
                  " approaved his apointment......."),
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 10,),
                textSk(context,"Appointment Time",null,Color(0xff484848),FontWeight.bold,20)
              ],
            ),
            SizedBox(height: 25,),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  containerSk(context, 35, 100, Color(0xffE3E3E3),BorderRadius.circular(10)
                      ,Padding(padding:EdgeInsets.all(3),child:
                      textSk(context,"9:30 AM",TextAlign.center,Colors.black,null,18),)),
                  SizedBox(width: 50,),
                  imageSk("assets/desh.png",4, BoxFit.none),
                  SizedBox(width: 50,),

                  containerSk(context, 35, 100, Color(0xffE3E3E3),BorderRadius.circular(10)
                      ,Padding(padding: EdgeInsets.all(3),child:
                      textSk(context,"12:30 PM",TextAlign.center,Colors.black,null,18),)),
                ],
              ),
            SizedBox(height: 40,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                containerSk(context,35,140,Color(0xffD5A300),BorderRadius.circular(12),
                Padding(padding: EdgeInsets.all(6),child: textSk(context,"Decline Request",
                    TextAlign.center,Colors.white,FontWeight.w500,14),
                )),
                SizedBox(width: 50,),
                containerSk(context,35,140,Color(0xffD5A300),BorderRadius.circular(12),
                    Padding(padding: EdgeInsets.all(5),child: textSk(context,"Approve Request",
                        TextAlign.center,Colors.white,FontWeight.w500,14),))
              ],
            ),
            SizedBox(height: 70,),
            Center(
              child: containerSk(context,35,70,Color(0xffD5a300),BorderRadius.circular(10),
              Padding(padding: EdgeInsets.all(5),child: textSk(context,"Close",TextAlign.center,Colors.white,
              FontWeight.w500,16),)),
            ),
            SizedBox(height: 25,),
          ],
        ),

      ),
    ), );
  }
}
