import 'package:flutter/material.dart';

 goToNextScreen(BuildContext context, dynamic screen,{Function()? reloadCallback}) {
   Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen)).then((value){

    reloadCallback!();

  });
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
