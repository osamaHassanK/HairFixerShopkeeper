import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hairfixxer_shopkeeper/auth/googlesigninprovider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'Utilities/Checker.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: FutureBuilder(
                future: isUserLogin(),
                builder:
                    (BuildContext context, AsyncSnapshot<Widget> snapshot) {
                  if (snapshot.hasData) {
                    return snapshot.data!;
                  } else {
                    return Material(
                        child: Center(
                            child: Lottie.asset(
                                "assets/animations/hair_fixerr_loader_animation.json",
                                width: 100,
                                height: 100)));
                  }
                })),
      );
}

// class Checker {
//   Future<Widget> isUserLogin() {
//     bool isLoggedIn = false;
//     bool isShopCreated = false;
//     bool isShopApproved = false;
//     User? user = FirebaseAuth.instance.currentUser;
//     if (user == null) {
//       print('User is currently signed out!');
//       isLoggedIn = false;
//     } else {
//       print('User is signed in!');
//       isLoggedIn = true;
//     }
//
//     return Checker().isShopCreated().then((isShopCreated) {
//       if (isLoggedIn) {
//         if (isShopCreated) {
//
//           return BottomNavigatorBar();
//         }
//         return ShopRegistration();
//       } else if (isLoggedIn == false) {
//         if (isShopCreated) {
//           return LoginScreen();
//         }
//         return LoginScreen();
//       } else {
//         return LoginScreen();
//       }
//     });
//
//     //return CircularProgressIndicator();
//   }
//
//   Future<bool> isShopCreated() async {
//     Future<DocumentSnapshot<Map<String, dynamic>>> data =
//         shopRef.doc(userId).get();
//
//     data.then((value) {
//       if (value.data()!['isShopCreated'] != null) {
//         return value.data()!['isShopCreated'];
//       } else {
//         return false;
//       }
//     });
//     return false;
//   }
// }
// StreamBuilder(
// stream: FirebaseAuth.instance.authStateChanges(),
// builder: (context,snapshot) {
// if(snapshot.connectionState==ConnectionState.waiting){
// return  Center(
// child: CircularProgressIndicator(),
// );
// }
// else if(snapshot.hasError){
// return Center(
// child: Text("Something went wrong"),
// );
// }
// else if(snapshot.hasData){
// return BottomNavigatorBar();
// }
// return LoginScreen();
// }
// ),
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
