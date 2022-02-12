import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hairfixxer_shopkeeper/Utilities/FirestoreDbRerences.dart';

class AppointmentScreenViewModel extends GetxController{


  Future<QuerySnapshot<Map<String, dynamic>>>? getAttendedAppointmentsList() {
    return firestoreAttendedAppointmentRef.orderBy('createdAt',descending: true).get();
  }




}