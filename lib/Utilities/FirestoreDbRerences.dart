import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
final authInstance = FirebaseAuth.instance;
final userId =  authInstance.currentUser!= null?authInstance.currentUser!.uid:null;
final firestoreInstance = FirebaseFirestore.instance;
final shopUserRef = FirebaseFirestore.instance.collection("ShopKeepers").doc(userId);
final shopInfoRef = FirebaseFirestore.instance.collection("ShopKeepers").doc(userId).collection('shopInfo').doc('shopInfo');
final shopInfoRefWithoutShopId = FirebaseFirestore.instance.collection("ShopKeepersWithoutShopId").doc('dataWithoutShopId').collection('shopInfo').doc(userId);
final firestoreCatalogRef=FirebaseFirestore.instance.collection("ShopKeepers").doc(userId).collection('Catalog');
final firestoreAttendedAppointmentRef=FirebaseFirestore.instance.collection("ShopKeepers").doc(userId).collection('shopInfo').doc(userId).collection('AttendedAppointments');
final firestoreUnAttendedAppointmentRef=FirebaseFirestore.instance.collection("ShopKeepers").doc(userId).collection('shopInfo').doc(userId).collection('UnattendedAppoinments');
final firebaseStorageRef=firebase_storage.FirebaseStorage.instance;
final firebaseStorageShopImagesRef=firebase_storage.FirebaseStorage.instance.ref('shopImages');
final firebaseStorageShopCatalogImagesRef=firebase_storage.FirebaseStorage.instance.ref('shopImages').child(userId! + "shopImage").child('catalogItemImages');
final firestoreShopDealsCollectionRef=FirebaseFirestore.instance.collection('ShopKeepers').doc(userId).collection('Deals');

