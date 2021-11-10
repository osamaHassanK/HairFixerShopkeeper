import 'package:flutter/material.dart';

Widget topTitle(BuildContext context,String text,){
 return Container(
    width: double.infinity,
    height: MediaQuery.of(context).size.height*0.060,
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
          child:Image.asset("assets/$assets1",scale: 4,),
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

Widget textSK(String text,double size,Color color,
    FontWeight weight, TextAlign align){
  return Text(text,
    style: TextStyle(fontSize:size,color: color,fontWeight:weight),
     textAlign:align
  );
}

class TextField1{


  Widget textField1([Function? validate,String? imageSk,Color? fillcolor,
    bool? filled,String? label,double? radius,]){
    return Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
    boxShadow: [
    BoxShadow(
    color: Colors.black26.withOpacity(0.1),
    blurRadius: 1,
    offset: const Offset(0, 4))
    ],),
    child:TextFormField(
      validator: validatorEmail(),
      // controller: _emailController,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(
              left: 25, top: 12, bottom: 12, right: 20),
          child: imageSk==null? null: Image.asset(
            'assets/userimage.png',
            scale: 4,
            fit: BoxFit.fill,
          ),
        ),
        fillColor:fillcolor,
        filled: filled,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(radius!)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius!)),
        labelText: label,
        labelStyle: TextStyle(
            color: Colors.black12,
            fontWeight: FontWeight.bold,
            fontSize: 18),
      ),)
    );

  }
  validatorPasword (){
    validator: (val) {
      if (val!.isEmpty) {
        return "Please enter your Password";
      } else if (!val.contains('@')) {
        return ("Please enter a valid email");
      }
      return null;
    };
  }
  validatorEmail (){
    validator: (val) {
      if (val!.isEmpty) {
        return "Please enter your email";
      } else if (!val.contains('@')) {
        return ("Please enter a valid email");
      }
      return null;
    };
  }
}