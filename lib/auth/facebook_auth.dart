import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:hairfixxer_shopkeeper/Utilities/Checker.dart';

import '../Utilities/FirestoreDbRerences.dart';

signInWithFacebook() async {
  try {
    final LoginResult result = await FacebookAuth.instance.login();
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(result.accessToken!.token);
    final credentialInfo = await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);

    //--saving shopkeeper data globally--//

    shopKeeperName = credentialInfo.user!.displayName!;
    shopKeeperImageUrl = credentialInfo.user!.photoURL!;

    //----done---//

    //-----uploading shopKeeper data----//
    shopUserRef
        .set({
          'shopKeeperName': credentialInfo.user!.displayName,
          'email': credentialInfo.user!.email,
          'password': "no pass",
          'imageUrl': credentialInfo.user!.photoURL,
          'id': credentialInfo.user!.uid,
          'isShopCreated': false,
          'accType': 'facebook',
          'isShopApproved': false,
        })
        .then((value) => print("data uploaded successfully"))
        .catchError((error) => print("Failed to add user: $error"));

    //---uploading done----//

  } catch (e) {
    print(e.toString());
  }
}
