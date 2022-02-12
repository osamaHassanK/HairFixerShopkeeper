import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hairfixxer_shopkeeper/Utilities/Checker.dart';
import 'package:hairfixxer_shopkeeper/Utilities/my_navigator.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/bottom_navigation_bar/bottom_navigator_bar.dart';
import 'package:hairfixxer_shopkeeper/screensfolder/create_shop_screen/shop_registration_reminder_screen.dart';
import 'package:hairfixxer_shopkeeper/shop_type_screen/shop_type_screen.dart';

import '../Utilities/FirestoreDbRerences.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin(BuildContext context) async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final credentialInfo =
          await FirebaseAuth.instance.signInWithCredential(credential);


      //--saving shopkeeper data globally--//

      shopKeeperName = credentialInfo.user!.displayName!;
      shopKeeperImageUrl = credentialInfo.user!.photoURL!;

      //----done---//

      //-----uploading shopKeeper data----//
      shopUserRef.set({
        'shopKeeperName': credentialInfo.user!.displayName,
        'email': credentialInfo.user!.email,
        'password': "no pass",
        'imageUrl': credentialInfo.user!.photoURL,
        'id': credentialInfo.user!.uid,
        'accType': 'google',
        'isShopApproved': false,
      }).then((value) {
        print("data uploaded successfully");

        if (isShopCreated) {
          goToNextScreenWithoutStack(context, BottomNavigatorBar());
        } else {
            goToNextScreenWithoutStack(context, ShopTypeScreen());
        }
      }).catchError((error) => print("Failed to add user: $error"));

      //---uploading done----//

      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  Future logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
