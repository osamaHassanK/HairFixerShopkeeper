import 'package:flutter/material.dart';
import 'package:hairfixxer_shopkeeper/shop%20creation%20pages/catlog_for_hair.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/text_widget.dart';



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
         width: 100,
         height: 48,
         child: ElevatedButton(
           child:
           textSk(context,' Done ',null,Colors.white,FontWeight.bold,19),
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
                     title:textSk(context,"congratulation",TextAlign.center,Color(0xffD7A700)
                     ,FontWeight.normal,null),
                     content: textSk(context,"Your Shop has been Registered successfully"),
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
                             child:textSk(context,"close",null,Colors.white,FontWeight.bold,17), ),
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
Widget serviceContainer(BuildContext,context,String serviceName,String index,
    double money){
  return  Column(
    children: [
      Stack(
        children:[
          Padding(
            padding: const EdgeInsets.only(left: 8.0,top: 8.0),
            child: Container(
              height: 100,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 7,
                    offset: Offset(0,02), // changes position of shadow
                  ),
                ],
              ),
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child:
                  textSk(context,serviceName,TextAlign.center,Colors.black,FontWeight.w400,13),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6.0,top: 8,),
            child: Container(
              width: 154,
              height: 72.0,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(index==null ? "cross.png": index,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          )
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text( "$money\$"),
      ),
    ],
  );
}