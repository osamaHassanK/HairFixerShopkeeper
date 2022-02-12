import 'package:flutter/material.dart';

Widget my_text_field(
    {String? hintText,
    fieldColor,
    controller,
    double innerContentPaddingTop = 0,
    double innerContentPaddingBottom = 0,
    double innerContentPaddingLeft = 0.0,
    double innerContentPaddingRight = 0,
    double marginLeft = 0,
    TextInputType inputType = TextInputType.text,
    double marginRight = 0,
    double marginTop = 0,
    double marginBottom = 0}) {
  return Padding(
    padding: EdgeInsets.only(
        right: marginRight,
        bottom: marginBottom,
        left: marginLeft,
        top: marginTop),
    child: TextFormField(
      keyboardType:inputType ,
        controller: controller,
        decoration: InputDecoration(
            alignLabelWithHint: false,
            labelText: hintText,

            labelStyle: TextStyle(color: Colors.black26),
            filled: true,
            fillColor: fieldColor,
            contentPadding: EdgeInsets.only(
                left: innerContentPaddingLeft,
                bottom: innerContentPaddingBottom,
                top: innerContentPaddingTop,
                right: innerContentPaddingRight),
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
            ))),
  );
}
