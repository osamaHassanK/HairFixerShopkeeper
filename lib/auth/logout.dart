import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hairfixxer_shopkeeper/auth/googlesigninprovider.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/login_screen.dart';
import 'package:provider/provider.dart';

Widget logout(BuildContext context,Widget widget){
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
    child: widget
  );
}