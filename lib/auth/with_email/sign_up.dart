import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hairfixxer_shopkeeper/Utilities/FirestoreDbRerences.dart';
import 'package:hairfixxer_shopkeeper/Utilities/Checker.dart'
    as globalShopkeeperInfo;
import 'package:hairfixxer_shopkeeper/screensfolder/varification.dart';

class SignUpWithEmail extends StatefulWidget {
  SignUpWithEmail(
      {Key? key,
      required this.shopKeeperName,
      required this.password,
      required this.confirmPassword,
      required this.email})
      : super(key: key);
  var password;
  var shopKeeperName;
  var confirmPassword;
  var email;

  registration(BuildContext context) async {
    if (password == confirmPassword) {
      try {
        firebase_auth.UserCredential userCredential = await FirebaseAuth
            .instance
            .createUserWithEmailAndPassword(email: email, password: password);
        print(userCredential);

        //--saving shopkeeper data globally--//
        globalShopkeeperInfo.shopKeeperName = this.shopKeeperName;
        globalShopkeeperInfo.shopKeeperImageUrl = "";

        //----done---//

        //-----uploading shopKeeper data----//
        shopUserRef.set({
              'shopKeeperName': shopKeeperName,
              'email': email,
              'password': password,
              'imageUrl': "null",
              'accType': 'email/pass',
              'id': userId,
              'isShopCreated': false,
              'isShopApproved': false,
            })
            .then((value) => print("data uploaded successfully"))
            .catchError((error) => print("Failed to add user: $error"));

        //---uploading done----//

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.amber,
            content: Text(
              "Registered Successfully.Please Logged In..",
              style: TextStyle(fontSize: 16),
            )));
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (builder) => Verification()),
            (route) => false);
      } on FirebaseException catch (e) {
        if (e.code == 'weak-password') {
          print("Password provided is to weak");
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Password provided is to weak",
                style: TextStyle(fontSize: 16),
              )));
        } else if (e.code == 'email-already-in-use') {
          print("Account already exist");
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Account already exist",
                style: TextStyle(fontSize: 16),
              )));
        }
      }
    } else {
      print("password or confirm password does not match");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            "password or confirm password does not match",
            style: TextStyle(fontSize: 18),
          )));
    }
  }

  @override
  _SignUpWithEmailState createState() => _SignUpWithEmailState();
}

class _SignUpWithEmailState extends State<SignUpWithEmail> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
