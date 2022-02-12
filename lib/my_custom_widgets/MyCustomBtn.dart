import 'package:flutter/material.dart';

import 'my_text_widget.dart';

class MyCustomBtn extends StatelessWidget {
  BuildContext context;

  String? btnText;
  var btnTextColor;
  var btnTextSize;
  var btnTextWeight;
  Function()? onTap;
  double height = 0.0;
  double width = 0.0;
  Color? color;
  double topLeft = 0.0;
  double topRight = 0.0;
  double bottomLeft = 0.0;
  double bottomRight = 0.0;
  double marginLeft = 0.0;
  double marginRight = 0.0;
  double marginTop = 0.0;
  double marginBottom = 0.0;
  double textMarginLeft=0.0;
  MyCustomBtn({
    Key? key,
    required this. context,
    this. btnText,
    this. btnTextColor,
    this. btnTextSize,
    this. btnTextWeight,
    this. onTap,
    this. height = 0.0,
    this. width = 0.0,
    this. color,
    this. topLeft = 0.0,
    this. topRight = 0.0,
    this. bottomLeft = 0.0,
    this. bottomRight = 0.0,
    this. marginLeft = 0.0,
    this. marginRight = 0.0,
    this. marginTop = 0.0,
    this. marginBottom = 0.0,
    this. textMarginLeft=0.0,

    this.align,
  }) : super(key: key);

  dynamic align ;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(
          top: marginTop,
          bottom: marginBottom,
          left: marginLeft,
          right: marginRight),
      child: InkWell(
        onTap: () => onTap!(),
        child: Container(
          height: height,
          width: width,
          alignment: Alignment.center,
          child: Align(
            alignment: align,
            child: myResponsiveText(
marginLeft:textMarginLeft ,

                text: btnText!,
                initialFontSize: btnTextSize,
                textColor: btnTextColor,
                weight: btnTextWeight),
          ),
          decoration: (BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(bottomRight),
                bottomLeft: Radius.circular(bottomLeft),
                topLeft: Radius.circular(topLeft),
                topRight: Radius.circular(topRight)),
          )),
        ),
      ),
    );
  }
}

// Widget myContainerAsButton({
//   required BuildContext context,
//   String? btnText,
//   var btnTextColor,
//   var btnTextSize,
//   var btnTextWeight,
//   Function()? onTap,
//   double height = 0.0,
//   double width = 0.0,
//   Color? color,
//   double topLeft = 0.0,
//   double topRight = 0.0,
//   double bottomLeft = 0.0,
//   double bottomRight = 0.0,
//   double marginLeft = 0.0,
//   double marginRight = 0.0,
//   double marginTop = 0.0,
//   double marginBottom = 0.0,
// }) {
//   return Padding(
//     padding: EdgeInsets.only(
//         top: marginTop,
//         bottom: marginBottom,
//         left: marginLeft,
//         right: marginRight),
//     child: InkWell(
//       onTap: () => onTap!(),
//       child: Container(
//         height: height,
//         width: width,
//         alignment: Alignment.center,
//         child: myResponsiveText(
//             text: btnText!,
//             initialFontSize: btnTextSize,
//             textColor: btnTextColor,
//             weight: btnTextWeight),
//         decoration: (BoxDecoration(
//           color: color,
//           borderRadius: BorderRadius.only(
//               bottomRight: Radius.circular(bottomRight),
//               bottomLeft: Radius.circular(bottomLeft),
//               topLeft: Radius.circular(topLeft),
//               topRight: Radius.circular(topRight)),
//         )),
//       ),
//     ),
//   );
// }
