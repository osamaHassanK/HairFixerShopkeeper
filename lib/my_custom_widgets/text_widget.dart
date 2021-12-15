import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget textSk(BuildContext context,[String? text,TextAlign? align,Color? color,
  FontWeight? weight,double? size
]){
  return Text(
    text!,textAlign: align,
    style: GoogleFonts.poppins(color: color,fontWeight: weight,fontSize: size),
  );
}
