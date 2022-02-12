import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairfixxer_shopkeeper/Utilities/FirestoreDbRerences.dart';
import 'package:hairfixxer_shopkeeper/Utilities/base.dart';
import 'package:hairfixxer_shopkeeper/Utilities/firestore_services.dart';
import 'package:hairfixxer_shopkeeper/base.dart';
import 'package:hairfixxer_shopkeeper/model/CatalogItem.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';
import 'package:path_provider/path_provider.dart';

class CreateCatalogViewModel extends GetxController {


  RxString? price = 'Click Here To Select Price'.obs;
  RxString? category = 'Click Here To Select Category'.obs;
  var isClicked=false.obs;
  var image=File('').obs;



  pickImage(context, ImgSource source,
      Function(File croppedImage, String imageAddress) callback) {
    selectImageFormGallery(context, source, callback);
  }

  Future<void> uploadImageToFirebaseStorageAndUploadCatalogData(
      context,
      catalogItemNameController,
      catalogItemPrice,
      catalogItemCategory,
      File catalogItemImgUrl,
      catalogItemImageAddress,
      {Function? onUploadSuccessfully,
      Function? onError}) async {

      try {
        // setState(() {
        //   isClicked = true;
        // });

        firebaseStorageShopCatalogImagesRef
            .child(catalogItemImageAddress)
            .putFile(catalogItemImgUrl)
            .then((res) async {
          var imageUrl = await res.ref.getDownloadURL();
          uploadCatalogItemData(
            catalogItem: CatalogItem(
                catalogItemNameController.text,
                catalogItemPrice,
                catalogItemCategory,
                imageUrl,
                FieldValue.serverTimestamp()),
          ).then((value) {
            updateData({'isCatalogExist': true}).then((value) {
              onUploadSuccessfully!();
            }).catchError((error) {
              print(error);
              onError!();
            });
          });
          print(imageUrl);
        });
//         .then((value) {
//           updateData({'isCatalogExist': true}).whenComplete(() {
//
//
//             // setState(() {
//             //   isClicked = false;
//             // });
// // show dialog
//             //  goToNextScreenWithoutStack(context, BottomNavigatorBar());
//           }).catchError((error) {
//             print(error);
//             //onError!();
//           });
//         }).whenComplete(() {});
      } on FirebaseException catch (e) {
        if (e is SocketException) {
          showSnackBar(
              context: context, text: 'Please Check You Network Connection');
          print("Socket exception: ${e.toString()}");
        } else if (e is TimeoutException) {
          showSnackBar(context: context, text: 'Timeout Please Try Again');
          print("Timeout exception: ${e.toString()}");
        } else {
          showSnackBar(
              context: context,
              text: 'Something Went Wrong Please Try Again Later');
          print("Unhandled exception: ${e.toString()}");
        }
      }


  }

  Future<void> uploadCatalogItemData(
      {required CatalogItem catalogItem,
      Function? onUploadSuccessfully,
      Function? onError}) async {
    final ref = firestoreCatalogRef.withConverter<CatalogItem>(
      fromFirestore: (snapshot, _) => CatalogItem.fromJson(snapshot.data()!),
      toFirestore: (catalogItem, _) => catalogItem.toJson(),
    );
    await ref.add( catalogItem);
  }

  showShopCompletionDialog(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Congratulation",
              style: TextStyle(color: Color(0xffD7A700)),
              textAlign: TextAlign.center,
            ),
            content: Text("Catalog Item Added successfully"),
            actions: <Widget>[
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      //Navigator.pop(context);
                      // Navigator.of(context).pushReplacement(MaterialPageRoute(
                      //   builder: (context) => Notifications(),
                      // ));
                    },
                    child: Text('OK')),
              ),
            ],
          );
        });
  }

  //----editing catalog item ----//

  Future<void>? editCatalogItem(context, docId, lastImageFile, newImageFile,
      CatalogItem catalogItem, Function() onUploadSuccessfully) {
    if (!identical(lastImageFile, newImageFile)) {
      firebaseStorageShopCatalogImagesRef
          .child(userId! + "shopImage")
          .putFile(newImageFile)
          .then((res) async {
        var imageUrl = await res.ref.getDownloadURL();
        firestoreCatalogRef.doc(docId).update({
          'catalogItemName': catalogItem.catalogItemName,
          'catalogItemPrice': catalogItem.catalogItemPrice,
          'catalogItemCategory': catalogItem.catalogItemCategory,
          'catalogItemImgUrl': imageUrl,
        }).then((value) {
          onUploadSuccessfully();
          // goToNextScreenWithoutStack(context,)
        }).catchError((error) => print("Failed to update user: $error"));
      });
    } else {
      firestoreCatalogRef.doc(docId).update({
        'catalogItemName': catalogItem.catalogItemName,
        'catalogItemPrice': catalogItem.catalogItemPrice,
        'catalogItemCategory': catalogItem.catalogItemCategory,
        'catalogItemImgUrl': catalogItem.catalogItemImgUrl,
      }).then((value) {
        onUploadSuccessfully();
//      Navigator.pop(context);
        // goToNextScreenWithoutStack(context,)
      }).catchError((error) => print("Failed to update user: $error"));
    }
  }


  //---Converting url to file instance----//
  Future<File> urlToFile(String imageUrl) async {
// generate random number.
    var rng = new Random();
// get temporary directory of device.
    Directory tempDir = await getTemporaryDirectory();
// get temporary path from temporary directory.
    String tempPath = tempDir.path;
// create a new file in temporary path with random file name.
    File file = new File('$tempPath' + (rng.nextInt(100)).toString() + '.png');
// call http.get method and pass imageUrl into it to get response.
    http.Response response = await http.get(Uri.parse(imageUrl));
// write bodyBytes received in response to file.
    await file.writeAsBytes(response.bodyBytes);
// now return the file which is created with random name in
// temporary directory and image bytes from response is written to // that file.
    return file;
  }
}
