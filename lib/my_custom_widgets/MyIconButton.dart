import 'package:flutter/material.dart';

import 'my_text_widget.dart';

class MyIconButton extends StatelessWidget {
  var textColor;
  double widht = 0;
  String buttonText;
  double height = 0;
  double textFontSize = 0;
  var textFontWeight;
  Function()? onTap;
  double cornerRadius = 0;
  String iconImage;
  var buttonColor;
  var iconSize;
  var borderColor;
  double marginLeftInText=0.0;

  MyIconButton(
      {Key? key,
      required this.buttonText,
      required this.iconImage,
      this.widht = 0,
      this.height = 0,
      this.textColor,
      this.textFontSize = 0,
      this.textFontWeight,
      this.onTap,
      this.borderColor,
      this.cornerRadius = 0,
      this.buttonColor,
      this.marginLeftInText=0,
      this.iconSize})
      : super(key: key);

  //
  // final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  //   onPrimary:textColor,
  //   primary: AppColor.APP_YELLOW_COLOR,
  //   minimumSize: Size(88, 36),
  //   padding: EdgeInsets.symmetric(horizontal: widht, vertical: height),
  //   shape: RoundedRectangleBorder(
  //     borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
  //   ),
  // );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> onTap!(),
      child: Container(
        width: widht,
          height: height,
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Image.asset(
                    iconImage,
                    scale: iconSize,
                  )),
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.only(left: marginLeftInText),
                    child: myResponsiveText(
                        text: buttonText,
                        textColor: textColor,
                        initialFontSize: textFontSize,
                        weight: textFontWeight),
                  ))
            ],
          ),
          decoration: BoxDecoration(
            color: buttonColor,
            boxShadow: [
          BoxShadow(
          color: Colors.grey.withOpacity(0.6),
        spreadRadius: 2,
        blurRadius: 5,
        offset: Offset(0, 3), // changes position of shadow
      ),
      ],
            border:   Border.all(
              color: borderColor,
            ),
            borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
          )),
    );
  }
}
// ElevatedButton.icon(
// icon: Image.asset(iconImage,scale: iconSize,), label: myResponsiveText(text: buttonText,textColor: textColor,
// initialFontSize: textFontSize,
// weight: textFontWeight),
// onPressed: () => onTap!(),
// style: ElevatedButton.styleFrom(
// onPrimary: textColor,
// primary: buttonColor,
// minimumSize: Size(88, 36),
// padding: EdgeInsets.symmetric(horizontal: widht, vertical: height),
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
// ),));
