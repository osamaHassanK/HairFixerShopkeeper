import 'package:flutter/material.dart';
import 'package:hairfixxer_shopkeeper/auth/app_colors.dart';


OutlineInputBorder outlineBorder = OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.transparent));
Color textFieldFillColor = Color(0xffe6e6e6);
Widget customTimeAmPmDropDown(List<String> list,String am_pm_value,void function(price) ){
  return  InputDecorator(
    decoration:InputDecoration(
        border:outlineBorder,
        focusedBorder: outlineBorder,
        enabledBorder: outlineBorder,
        errorBorder: outlineBorder,
        disabledBorder:outlineBorder,
        filled: true,
        fillColor:AppColor.TEXT_FIELD_YELLOW_COLOR ,
        hintText: "Select Price",
        hintStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
        contentPadding:
        const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10)),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        // value: gender,
        isDense: true,
        isExpanded: true,
        items: list.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value.toString()),
          );
        }).toList(),
        hint: Text("",style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12)),
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15,color: Colors.black),
        onChanged: (newValue) {
          function(newValue);
          am_pm_value = newValue!;
        },
        value: am_pm_value,
      ),
    ),
  );
}
