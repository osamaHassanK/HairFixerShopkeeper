import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hairfixxer_shopkeeper/Utilities/FirestoreDbRerences.dart';
import 'package:hairfixxer_shopkeeper/my_custom_widgets/my_button.dart';

class CatalogScreenViewModel {
  bool isCatalogExist = false;

  Future<bool?>? getCatalogAvailabilityStatus() async {
    DocumentSnapshot<Map<String, dynamic>> data = await shopUserRef.get();
    if (data.data()!['isCatalogExist'] == null) {
      isCatalogExist = false;
      return isCatalogExist;
    } else {
      if (data.data()!['isCatalogExist']) {
        return isCatalogExist = false;
      } else {
        isCatalogExist = true;
        return isCatalogExist;
      }
    }
  }

  Future<QuerySnapshot<Map<String, dynamic>>>? getCatalogItems() {
    return firestoreCatalogRef.orderBy('createdAt',descending: true).get();
  }

//---deleting catalog item---//

  Future<void>? dltCatalog(
      String docId, { required Function() onDltSuccessfully,required Function(dynamic error) onError}) {
    firestoreCatalogRef.doc(docId).delete().then((value) => onDltSuccessfully()).onError((error, stackTrace) => onError(error));
  }

  // YYDialog showDialog({required BuildContext context, required String text}) {
  //   return YYDialog().build(context)
  //     ..width = Responsive.responsiveWidth(context,value: 0.6)
  //     ..height = Responsive.responsiveHeight(context,value: 0.2)
  //     ..widget(
  //       myUnResponsiveContainer(context: context),
  //     )
  //     ..show();
  // }

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
}
