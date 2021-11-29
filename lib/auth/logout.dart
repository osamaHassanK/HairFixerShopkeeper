import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hairfixxer_shopkeeper/auth/googlesigninprovider.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/sk_login.dart';
import 'package:hairfixxer_shopkeeper/widget/container_widget.dart';
import 'package:provider/provider.dart';

Widget logout(BuildContext context){
  final storage = new FlutterSecureStorage();
  return InkWell(
      onTap: () async {
        await FirebaseAuth.instance.signOut();
        await storage.delete(key: "uid");
        try {
          final provider = Provider.of<GoogleSignInProvider>(
              context,
              listen: false);
          provider.logout();
        } catch (e) {
          print("error");
        }
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (builder) => LoginScreen()),
                (route) => false);
      },
    child: Text("Logout")
  );
}