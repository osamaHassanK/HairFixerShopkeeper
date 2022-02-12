import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairfixxer_shopkeeper/auth/app_colors.dart';
class DropDownWidget extends StatefulWidget {
  List<String> list;
  var hint;
  Function(String value) callback;

  DropDownWidget(
      {Key? key,
      required this.hint,
      required this.list,
      required this.callback})
      : super(key: key);

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  OutlineInputBorder outlineBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.transparent));
  Color textFieldFillColor = Color(0xffe6e6e6);

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
          border: outlineBorder,
          focusedBorder: outlineBorder,
          enabledBorder: outlineBorder,
          errorBorder: outlineBorder,
          disabledBorder: outlineBorder,
          filled: true,
          fillColor: AppColor.TEXT_FIELD_YELLOW_COLOR,
          hintText: "Select Price",
          hintStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          // value: gender,
          isDense: true,
          isExpanded: true,
          items: widget.list.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value.toString()),
            );
          }).toList(),
          hint: Obx(()=>
             Text(widget.hint.toString(),
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12)),
          ),
          style: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 15, color: Colors.black),
          onChanged: (newValue) {
            widget.callback(newValue!);
            widget.hint = newValue as RxString;
          },

        ),
      ),
    );
  }
}
