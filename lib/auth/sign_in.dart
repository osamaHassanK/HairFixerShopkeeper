import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/sk_homescreen.dart';

class SignInWithEmail extends StatefulWidget {
  SignInWithEmail({Key? key,required this.email,required this.password}) : super(key: key);
  String email;
  var password;

  @override
  _SignInWithEmailState createState() => _SignInWithEmailState();

  final storage = new FlutterSecureStorage();
  userLogin(BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print(userCredential.user?.uid);
      await storage.write(key: "uid", value: userCredential.user?.uid);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (builder) => SkHomeScreen()),
              (route) => false);
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        print("No user found for that Email");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "No user found for that Email",
              style: TextStyle(fontSize: 16),
            )));
      } else if (e.code == 'wrong-password') {
        print("Wrong password");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "Wrong password",
              style: TextStyle(fontSize: 16),
            )));
      }
    }
  }
}

class _SignInWithEmailState extends State<SignInWithEmail> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
