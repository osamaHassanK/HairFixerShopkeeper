import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final authInstance = FirebaseAuth.instance;
final userId =  authInstance.currentUser!= null?authInstance.currentUser!.uid:null;
final firestoreInstance = FirebaseFirestore.instance;
final shopRef = FirebaseFirestore.instance.collection("ShopKeepers");
