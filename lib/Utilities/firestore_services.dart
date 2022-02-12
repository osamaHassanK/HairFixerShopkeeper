import 'package:flutter/material.dart';
import 'package:hairfixxer_shopkeeper/model/CatalogItem.dart';
import 'package:hairfixxer_shopkeeper/model/ShopInfo.dart';

import 'FirestoreDbRerences.dart';

Future<void> updateData(map) {
  return shopUserRef
      .update(map)
      .then((value) => print("User Updated"))
      .catchError((error) => print("Failed to update user: $error"));
}

Future<void>? updateShopInfo(context, lastImageFile, newImageFile, Shop shop) {
  if (!identical(lastImageFile, newImageFile)) {
    firebaseStorageShopImagesRef
        .child(userId! + "shopImage")
        .putFile(newImageFile)
        .then((res) async {
      var imageUrl = await res.ref.getDownloadURL();
      shopInfoRef.update({
        'shopName': shop.shopName,
        'shopAddress': shop.shopAddress,
        'shopContactNo': shop.shopContactNo,
        'shopImgUrl': imageUrl,
        'shopOpeningTiming': shop.shopOpeningTiming,
        'shopClosingTiming': shop.shopClosingTiming,
        'shopLocation':shop.shopLocation


      }).then((value) {
        Navigator.pop(context);
        // goToNextScreenWithoutStack(context,)
      }).catchError((error) => print("Failed to update user: $error"));
    });
  } else {
     shopInfoRef.update({
      'shopName': shop.shopName,
      'shopAddress': shop.shopAddress,
      'shopContactNo': shop.shopContactNo,
      'shopImgUrl': shop.shopImgUrl,
      'shopOpeningTiming': shop.shopOpeningTiming,
      'shopClosingTiming': shop.shopClosingTiming,
      'shopLocation':shop.shopLocation


    }).then((value) {
      Navigator.pop(context);
      // goToNextScreenWithoutStack(context,)
    }).catchError((error) => print("Failed to update user: $error"));
  }
}

