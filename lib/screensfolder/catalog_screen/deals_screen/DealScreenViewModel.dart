import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairfixxer_shopkeeper/Utilities/FirestoreDbRerences.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/my_button.dart';

class DealScreenViewModel extends GetxController{


  Future<QuerySnapshot<Map<String, dynamic>>>? getDeals() {
    return firestoreShopDealsCollectionRef.orderBy('createdAt',descending: true).get();
  }




  showDltDialog({context, titleText, DescText,Function()? onTapOnCanel,Function()? ontapOnYes}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              titleText,
              style: TextStyle(color: Color(0xffD7A700)),
              textAlign: TextAlign.center,
            ),
            content: Text(DescText),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: myButton(
                          buttonText: 'Yes',
                          onTap: () {
                            ontapOnYes!();
                          },
                          textColor: Colors.white,
                          textFontSize: 12
                      )),
                  myButton(
                      buttonText: 'Cancel',
                      onTap: () {
                        onTapOnCanel!();
                      },
                      textColor: Colors.white,
                      textFontSize: 12)
                ],
              ),
            ],
          );
        });
  }
  Future<void>? dltDeal(
      String docId, { required Function() onDltSuccessfully,required Function(dynamic error) onError}) {
    firestoreShopDealsCollectionRef.doc(docId).delete().then((value) => onDltSuccessfully()).onError((error, stackTrace) => onError(error));
  }

}


