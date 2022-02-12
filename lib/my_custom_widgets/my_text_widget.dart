import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget myResponsiveText({
  required String text,
  double initialFontSize = 1,
  Color textColor = const Color(0x0),
  int maxLines = 1,
  FontWeight? weight,
  TextAlign? align,
  double marginLeft = 0.0,
  double marginRight = 0.0,
  double marginTop = 0.0,
  double marginBottom = 0.0,
}) {
  return Padding(
    padding: EdgeInsets.only(
        top: marginTop,
        bottom: marginBottom,
        left: marginLeft,
        right: marginRight),
    child: AutoSizeText(
      text,
      textAlign: align,
      style: GoogleFonts.poppins(
        fontWeight: weight,
        fontSize: initialFontSize,
        color: textColor,
      ),
      maxLines: maxLines,
    ),
  );
}


Widget text(BuildContext context, String text, dynamic color, double size,var weight){
  return Text(
    text,
    style: GoogleFonts.poppins(
        color: color,
        fontSize: size,
        fontWeight: weight),
  );
}

Widget imagePath(BuildContext context,String image,double scale){
  return Image.asset("assets/$image",scale: scale,);
}
