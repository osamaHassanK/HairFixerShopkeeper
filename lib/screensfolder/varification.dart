import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/homescreen.dart';

class Verification extends StatefulWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {

  final auth=FirebaseAuth.instance;
  late User user;
  late Timer timer;

  @override
  void initState() {
    user=auth.currentUser!;
    user.sendEmailVerification();
    timer = Timer.periodic(Duration(seconds: 5), (timer){
      checkEmail();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }


  Future<void>checkEmail() async{
    user=auth.currentUser!;
    await user.reload();
    try{
      if(user.emailVerified){
        timer.cancel();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (builder) => SkHomeScreen()),
                (route) => false);
      }
    }on FirebaseException catch(e){
      if(e.code=='user-not-found'){
        print("No user found for that Email");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "No user found for that Email",
              style: TextStyle(fontSize: 16),
            )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Align(
            alignment: Alignment.center,
            child: Text("An Email has been sent to\n ${user.email} \nPlease verify")),
      ),
    );
  }
}
