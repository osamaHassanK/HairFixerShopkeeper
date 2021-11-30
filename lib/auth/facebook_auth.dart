
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

Future<UserCredential>signInWithFacebook() async{
  final LoginResult result=await FacebookAuth.instance.login();
  final OAuthCredential facebookAuthCredential=FacebookAuthProvider.credential(result.accessToken!.token);
  return await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
}