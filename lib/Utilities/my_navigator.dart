import 'package:flutter/material.dart';

goToNextScreen(BuildContext context, dynamic screen) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
}

goToNextScreenWithoutStack(BuildContext context, dynamic screen) {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => screen));
}

goToNextScreenWithoutStackWithData() {}

goToNextScreenWithData() {}

goBack(BuildContext context) {
  Navigator.of(context).pop();
}
