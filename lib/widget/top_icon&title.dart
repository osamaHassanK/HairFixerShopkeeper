
import 'package:flutter/material.dart';

Widget topTitle(BuildContext context,String text,){
  return Container(
    width: double.infinity,
    height: 50,
    color: Color(0xffD6A600),
    child: Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Text(text,
        style:TextStyle(fontSize: 23,color: Colors.white),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

Widget topIcon(BuildContext context,String assets1,String assets2,){
  return   Padding(
    padding: const EdgeInsets.only(top: 15.0,right: 15,left: 15,bottom: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: (){
            Navigator.pop(context,true);
          },
          child:Padding(padding: EdgeInsets.all(0),
          child: Image.asset("assets/$assets1",scale: 4,),)
        ),
        InkWell(
          onTap: (){
            Navigator.pop(context,true);
          },
          child:Image.asset("assets/$assets2",scale: 4,),
        )
      ],
    ),
  );
}