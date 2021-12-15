

import 'package:flutter/material.dart';
import 'package:hairfixxer_shopkeeper/base.dart';

class Field extends StatefulWidget {
  Field(
      {Key? key,
        required this.controller, required this.labelText, required this.path, required this.obsecureText,required this.eye})
      : super(key: key);

  TextEditingController controller = new TextEditingController();
  var labelText;
  String path;
  var eye;
  var obsecureText;

  @override
  _FieldState createState() => _FieldState();
}

class _FieldState extends State<Field> {
  @override

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
              color: Colors.black26.withOpacity(0.1),
              blurRadius: 1,
              offset: const Offset(0, 4))
        ],
      ),
      child: TextFormField(
          validator: (val) {
            if (val!.isEmpty) {
              return "$widget cannot be empty";
            }
            return null;
          },
          controller: widget.controller,
          obscureText: widget.obsecureText,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.only(
                  left: 25, top: 12, bottom: 12, right: 20),
              child:imageSk(widget.path,4, BoxFit.none)
            ),
            fillColor: Colors.white,
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(30)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            labelText: widget.labelText,
            labelStyle: TextStyle(
                color: Colors.black12,
                fontWeight: FontWeight.bold,
                fontSize: 18),
            suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 20), child: widget.eye?GestureDetector(
              onTap: (){
                setState(() {
                  widget.obsecureText=!widget.obsecureText;
                });
              },
              child: widget.obsecureText? Icon(Icons.visibility_off,color: Colors.grey):
              Icon(Icons.visibility,color: Colors.blue),
            ):Container(width: 10,color: Colors.transparent,)),
          )),
    );
  }
}

Widget textFieldN(String label,bool filled){
  return TextFormField(
      decoration: InputDecoration(
        alignLabelWithHint: false,
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.black26
        ),

        filled: filled,
        fillColor: Color(0xffFFFBEF),
        contentPadding: const EdgeInsets.only(
            left: 14.0, bottom: 6.0, top: 8.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.amber),
          borderRadius: BorderRadius.circular(10.0),
        )
      ));


}