import 'package:flutter/cupertino.dart';

class Responsive {
  static double responsiveWidth(BuildContext context, {double value=1.0}) => MediaQuery.of(context).size.width * value;

  static double responsiveHeight(BuildContext context, {double value=1.0}) => MediaQuery.of(context).size.height * value;
}
