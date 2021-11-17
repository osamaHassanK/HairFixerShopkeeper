import 'package:flutter/material.dart';

import 'catlog_for_hair.dart';


class WidgetsSk{
   Widget containerSk(BuildContext context,
       [dynamic h,dynamic w,Color? color,BorderRadius? bRadius,
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

   Widget textSk(BuildContext context,[String? text,TextAlign? align,Color? color,
   FontWeight? weight,double? size
   ]){
     return Text(
       text!,textAlign: align,
       style: TextStyle(color:color,fontWeight: weight,fontSize: size,),
     );
   }
}

 class ShowDialogue extends StatefulWidget {
   const ShowDialogue({Key? key}) : super(key: key);

   @override
   _ShowDialogueState createState() => _ShowDialogueState();
 }

 class _ShowDialogueState extends State<ShowDialogue> {
   @override
   Widget build(BuildContext context) {
     return Padding(
       padding: const EdgeInsets.only(top: 20.0),
       child: SizedBox(
         width: 120,
         height: 48,
         child: ElevatedButton(
           child: Text(
             ' Done ',
             style: TextStyle(fontSize: 19),
           ),
           style: ElevatedButton.styleFrom(
             primary: Color(0xffD7A700),
             onPrimary: Colors.white,
             shape: const BeveledRectangleBorder(
                 borderRadius:
                 BorderRadius.all(Radius.circular(5))),
           ),
           onPressed: () {
             showDialog(
                 context: context,
                 builder: (context) {
                   return AlertDialog(
                     title: Text(
                       "Congratulation",
                       style: TextStyle(
                           color: Color(0xffD7A700)),
                       textAlign: TextAlign.center,
                     ),
                     content: Text(
                         "Your Shop has been Registered successfully"),
                     actions: <Widget>[
                       Center(
                         child: ElevatedButton(
                             style: ElevatedButton.styleFrom(
                               primary: Color(0xffD5A300),
                               shape: RoundedRectangleBorder(
                                 //to set border radius to button
                                   borderRadius:
                                   BorderRadius.circular(
                                       10)),
                             ),
                             onPressed: () {
                               Navigator.of(context)
                                   .pushReplacement(
                                   MaterialPageRoute(
                                     builder: (context) =>
                                         Catalog1(),
                                   ));
                             },
                             child: Text("close")),
                       ),
                     ],
                   );
                 });
           },
         ),
       ),
     );
   }
 }
