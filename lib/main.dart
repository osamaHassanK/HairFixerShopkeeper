import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/firstscreen.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/loginscreen.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/shop_registration.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/sign_in.dart';


void main() {
  runApp(MaterialApp(
    home: SplashScreen(),
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: FirstScreen(),
    );
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds:3),onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>ShopRegistration(),));

  }
}
