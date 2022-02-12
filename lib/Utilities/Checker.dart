import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hairfixxer_shopkeeper/Utilities/FirestoreDbRerences.dart';
import 'package:hairfixxer_shopkeeper/Utilities/base.dart';
import 'package:hairfixxer_shopkeeper/auth/app_colors.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/bottom_navigation_bar/bottom_navigator_bar.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/login_screen.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/create_shop_screen/shop_registration_reminder_screen.dart';
import 'package:hairfixxer_shopkeeper/shop_type_screen/shop_type_screen.dart';

bool isLoggedIn = false;
bool isShopCreated = false;
bool isShopApproved = false;
String shopKeeperName = "";
String shopKeeperImageUrl = "";

Future<Widget> isUserLogin(BuildContext context) async {
  User? user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    print('User is currently signed out!');
    isLoggedIn = false;
  } else {
    print('User is signed in!');
    isLoggedIn = true;
  }

  if (user != null) {
    try {
      DocumentSnapshot<Map<String, dynamic>> data =
          await getShopCreationStatus();

      if (data.data() != null) {
        if (data.data()!['isShopCreated'] != null) {

          isShopCreated = data.data()!['isShopCreated'];
          shopKeeperName = data.data()!['shopKeeperName'];
          shopKeeperImageUrl = data.data()!['imageUrl'];
          shopKeeperImageUrl;
        } else {
          isShopCreated = false;
          shopKeeperName = data.data()!['shopKeeperName'];
          shopKeeperImageUrl = data.data()!['imageUrl'];
        }
      } else {
        print("shop data value is null");
      }
    } on FirebaseException catch (e) {
      if (e is SocketException) {
        showSnackBar(context:context,text: 'Please Check You Network Connection' );
        print("Socket exception: ${e.toString()}");
      } else if (e is TimeoutException) {
        showSnackBar(context:context,text: 'Timeout Please Try Again' );
        print("Timeout exception: ${e.toString()}");
      } else{
        showSnackBar(context:context,text: 'Something Went Wrong Please Try Again Later' );
        print("Unhandled exception: ${e.toString()}");

      }
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
    return ShopTypeScreen();
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
      await shopUserRef.get();
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
        child: CachedNetworkImage(
          progressIndicatorBuilder: (context, url,
              downloadProgress) =>
              Center(
                  child:
                  CircularProgressIndicator(
                      color: AppColor.APP_YELLOW_COLOR,
                      strokeWidth: 3,
                      value: downloadProgress
                          .progress)),
          imageUrl: shopKeeperImageUrl,
          fit: BoxFit.fill,
        ));
  }
}
