import 'package:flutter/material.dart';


Widget imageSk(String image,double? scale,BoxFit fit ){
  return Image.asset(image,scale:scale,fit: fit);
}
class TextField1{

  Widget textField1([Function? validate,String? imageSk,Color? fillcolor,
    bool? filled,String? label,double? radius,double? circular,bool? booli]){
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
      obscureText:true,
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