import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hairfixxer_shopkeeper/auth/googlesigninprovider.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/startingscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)  => ChangeNotifierProvider (
    create: (context) => GoogleSignInProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartingScreen(),
    ),
  );
}

// Future main()async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MaterialApp(
//     home: SplashScreen(),
//   ));
// }
//
// class SplashScreen extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return SplashScreenState();
//   }
// }
//
// class SplashScreenState extends State<SplashScreen>{
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     loadData();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Container(
//       child: FirstScreen(),
//     );
//   }
//
//   Future<Timer> loadData() async {
//     return new Timer(Duration(seconds:3),onDoneLoading);
//   }
//
//   onDoneLoading() async {
//     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen(),));
//
//   }
// }