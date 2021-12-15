import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hairfixxer_shopkeeper/FirestoreDbRerences.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/bottomnavigatorbar.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/login_screen.dart';
import 'package:hairfixxer_shopkeeper/shop%20creation%20pages/shop_registration_reminder_screen.dart';

bool isLoggedIn = false;
bool isShopCreated = false;
bool isShopApproved = false;
String shopKeeperName = "";
String shopKeeperImageUrl = "";

Future<Widget> isUserLogin() async {
  User? user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    print('User is currently signed out!');
    isLoggedIn = false;
  } else {
    print('User is signed in!');
    isLoggedIn = true;
  }

  if (user != null) {
    DocumentSnapshot<Map<String, dynamic>> data = await getShopCreationStatus();


    if (data.data() != null) {
      if (data.data()!['isShopCreated'] != null) {
        isShopCreated = data.data()!['isShopCreated'];
        shopKeeperName=data.data()!['shopKeeperName'];
        shopKeeperImageUrl=data.data()!['imageUrl'];
shopKeeperImageUrl;
      } else {
        isShopCreated = false;
      }
    } else {
      print("shop data value is null");
    }
  }

  // if (data.data()!['isShopCreated'] != null) {
  //   shopKeeperName = data.data()!['shopKeeperName'];
  //   shopKeeperImageUrl = data.data()!['shopKeeperImageUrl'];
  //
  //   isShopCreated = data.data()!['isShopCreated'];
  // } else {
  //   isShopCreated = false;
  // }

  if (isLoggedIn) {
    if (isShopCreated) {
      return BottomNavigatorBar();
    }
    return ShopRegistration();
  } else if (isLoggedIn == false) {
    if (isShopCreated) {
      return LoginScreen();
    }
    return LoginScreen();
  } else {
    return LoginScreen();
  }

  //
  // .then((isShopCreated) {

  // });

  //return CircularProgressIndicator();
}

Future<DocumentSnapshot<Map<String, dynamic>>> getShopCreationStatus() async {
  DocumentSnapshot<Map<String, dynamic>> data =
      await shopRef.doc(FirebaseAuth.instance.currentUser!.uid).get();
  return data;
  // if (data.data()!['isShopCreated'] != null) {
  //
  //       shopKeeperName=data.data()!['shopKeeperName'];
  //       shopKeeperImageUrl=data.data()!['shopKeeperImageUrl'];
  //
  //       return data.data()!['isShopCreated'];
  //     } else {
  //       return false;
  //     }

  // return data.then((value) {
  //   if (value.data()!['isShopCreated'] != null) {
  //
  //     shopKeeperName=value.data()!['shopKeeperName'];
  //     shopKeeperImageUrl=value.data()!['shopKeeperImageUrl'];
  //
  //     return value.data()!['isShopCreated'];
  //   } else {
  //     return false;
  //   }
  // });
}

String getShopKeeperName() {
  if (shopKeeperName == "" || shopKeeperName == null) {
    return shopKeeperName = "";
  } else {
    return shopKeeperName;
  }
}

Widget getShopKeeperImageUrl() {
  if (shopKeeperImageUrl == "" || shopKeeperImageUrl == null) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.asset(
          "assets/no_profilr_pic_place_holder.png",
          scale: 15,
        ));
  } else {
    return ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.network(
          shopKeeperImageUrl,
          scale: 1,
        ));
  }
}
